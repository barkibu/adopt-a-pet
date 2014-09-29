class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :redirect_pet, only: [:show]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :authenticate_admin_user!, only: [:destroy]

  decorates_assigned :pets
  decorates_assigned :pet

  def show
    set_meta_tags title: SEO.title_for_show(pet),
      description: SEO.title_for_show(pet)

    @pets = Pet.near_from_province(@pet.province_id, @pet.id)
  end

  def new
    @pet = Pet.new
    3.times { @pet.pet_pictures.build }
  end

  def edit
    3.times { @pet.pet_pictures.build }
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to pet.adopt_specie_path, notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet.adopt_specie_path, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to root_url, notice: 'Pet was successfully destroyed.'
  end

  private
    def set_pet
      @pet = Pet.includes(:pet_pictures).find(params[:id])
    end

    def redirect_pet
      unless pet.adopt_specie_path == request.path
        redirect_to pet.adopt_specie_path, status: 301
      end
    end

    def pet_params
      params.require(:pet).permit(:age, :breed, :description, :location,
                                  :more_info_url, :name, :sex, :size, :specie,
                                  :urgent, :province_id,
                                  pet_pictures_attributes: [:asset, :_destroy, :id])
    end
end
