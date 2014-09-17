class SheltersController < ApplicationController
  before_action :set_shelter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin_user!, except: [:index, :show]

  # GET /shelters
  def index
    @shelters = Shelter.all
  end

  # GET /shelters/1
  def show
  end

  # GET /shelters/new
  def new
    @shelter = Shelter.new
  end

  # GET /shelters/1/edit
  def edit
  end

  # POST /shelters
  def create
    @shelter = Shelter.new(shelter_params)

    if @shelter.save
      redirect_to @shelter, notice: 'Shelter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shelters/1
  def update
    if @shelter.update(shelter_params)
      redirect_to @shelter, notice: 'Shelter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shelters/1
  def destroy
    @shelter.destroy
    redirect_to shelters_url, notice: 'Shelter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelter
      @shelter = Shelter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shelter_params
      params.require(:shelter).permit(:name, :description, :web_url, :location, :logo)
    end
end
