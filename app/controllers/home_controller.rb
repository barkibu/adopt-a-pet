class HomeController < ApplicationController
  decorates_assigned :pets
  before_action :set_specie, only: [:index]
  before_action :redirect_index, only: [:index]

  def index
    @province = Province.find_by_slug!(params[:province]) if params[:province]
    search_params = SearchParams.new(params)

    filtered_params = {}
    filtered_params[:specie] = Pet.species[@specie.key]
    filtered_params[:province] = @province.id if @province
    filtered_params.merge!(Pet.filtering_params(search_params.get))

    @pets = Pet.filter(filtered_params).default_filter_and_order.page(params[:page])

    set_meta_tags title: SEO.title_for_adopt(@specie, @province.to_s, nil),
      description: SEO.description_for_index(@specie, @province.to_s, params[:breed], params[:page])
  end

  def find
    search_params = SearchParams.new(params)
    adopt_species_params = search_params.get
    adopt_species_params.merge!(specie: search_params.species_to_url_params)
    adopt_species_params.merge!(province: params[:province]) if search_params.valid_province
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
