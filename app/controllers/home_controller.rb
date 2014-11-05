class HomeController < ApplicationController
  decorates_assigned :pets
  before_action :set_specie, only: [:index]
  before_action :redirect_index, only: [:index]

  def index
    @province = Province.find_by_slug!(params[:province]) if params[:province]

    filtered_params = {}
    filtered_params[:specie] = Pet.species[@specie.key]
    filtered_params[:province] = @province.id if @province
    filtered_params.merge!(Pet.filtering_params(SearchParams.get(params)))

    @pets = Pet.filter(filtered_params).default_filter_and_order.page(params[:page])

    set_meta_tags title: SEO.title_for_adopt(@specie, @province.to_s, nil),
      description: SEO.description_for_index(@specie, @province.to_s, params[:breed], params[:page])
  end

  def find
    adopt_species_params = SearchParams.get(params)
    adopt_species_params.merge!(specie: SearchParams.species_to_url_params(params))
    adopt_species_params.merge!(province: params[:province]) if SearchParams.valid_province params
    redirect_to adopt_species_path(adopt_species_params)
  end

  private

  def set_specie
    @specie = Specie.find_by_value params[:specie]
  end

  def redirect_index
    if @specie.key == :pet && params[:province].blank? && request.query_string.empty? && request.path != root_path
      redirect_to :root
    end
  end
end
