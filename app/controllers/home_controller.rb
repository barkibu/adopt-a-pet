class HomeController < ApplicationController
  decorates_assigned :pets

  def index
    specie = Specie.find_by_specie params[:specie]

    if specie == :pet && params[:province].blank? && request.query_string.empty? && request.path != root_path
      redirect_to :root and return
    end

    @province = Province.find_by_slug!(params[:province]) if params[:province]

    filtered_params = {}
    filtered_params[:specie] = Pet.species[specie]
    filtered_params[:province] = @province.id if @province
    filtered_params.merge!(Pet.filtering_params valid_search_params(params))

    @pets = Pet.filter(filtered_params).default_filter_and_order.page(params[:page])

    set_meta_tags title: SEO.title_for_adopt(specie, @province.to_s, nil),
      description: SEO.description_for_index(specie, @province.to_s, params[:breed], params[:page])
  end

  def find
    filtered_params = valid_search_params(params)
    filtered_params.merge!(specie: species_params_to_url_params(params))
    filtered_params.merge!(province: params[:province]) if valid_province_param params[:province]
    redirect_to adopt_species_path(filtered_params)
  end

  private

  def valid_search_params(params)
    filter_keys = Pet.sizes.keys + Pet.ages.keys
    params.slice(*filter_keys.map(&:to_sym))
  end

  def valid_province_param(param)
    return unless param
    Province.where(slug: param).count == 1
  end

  def species_params_to_url_params(params)
    if params[:dog] and params[:cat]
      'mascotas'
    elsif params[:dog]
      'perros'
    elsif params[:cat]
      'gatos'
    else
      'mascotas'
    end
  end
end
