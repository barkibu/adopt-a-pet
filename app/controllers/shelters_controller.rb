class SheltersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_shelter, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @shelters = Shelter.all
    authorize Shelter
  end

  def show
  end

  def new
    @shelter = Shelter.new
    authorize @shelter
  end

  def edit
  end

  def create
    @shelter = Shelter.new(shelter_params)
    authorize @shelter

    if @shelter.save
      redirect_to @shelter, notice: 'Shelter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shelter.update(shelter_params)
      redirect_to @shelter, notice: 'Shelter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shelter.destroy
    redirect_to shelters_url, notice: 'Shelter was successfully destroyed.'
  end

  private
    def set_shelter
      @shelter = Shelter.find(params[:id])
      authorize @shelter
    end

    def shelter_params
      params.require(:shelter).permit(:name, :description, :web_url, :location, :logo)
    end
end
