class HomeController < ApplicationController
  def index
    @pets = Pet.page(params[:page]).per(24)
  end
end
