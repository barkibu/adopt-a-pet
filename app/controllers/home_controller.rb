class HomeController < ApplicationController
  decorates_assigned :pets

  def index
    filtered_params = Pet.filtering_params valid_search_params(params)
    @pets = Pet.filter(filtered_params).default_filter_and_order.page(params[:page])
  end

  def find
    redirect_to root_path(valid_search_params(params))
  end

  def adopt
    @pets = Pet.default_filter_and_order.page(params[:page])
    render 'index'
  end

  private

  def valid_search_params(params)
    filter_keys = Pet.species.keys + Pet.sizes.keys + Pet.ages.keys
    params.slice(*filter_keys.map(&:to_sym))
  end
end
