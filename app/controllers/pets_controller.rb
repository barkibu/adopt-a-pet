class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :adopt]
  before_action :set_adopt_message, only: [:show, :adopt]
  before_action :redirect_pet, only: [:show]
  after_action :verify_authorized

  decorates_assigned :pets
  decorates_assigned :pet

  def show
    set_meta_tags title: SEO.title_for_show(pet),
      description: SEO.title_for_show(pet)

    @pets = Pet.near_from_province(@pet.province_id, @pet.specie, @pet.id)
  end

  def new
    @pet = Pet.new
    authorize @pet
    3.times { @pet.pet_pictures.build }
  end

  def edit
    3.times { @pet.pet_pictures.build }
  end

  def create
    @pet = current_user.pets.new(pet_params)
    authorize @pet

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

  def adopt
    if @adopt_message.valid?
      AdoptMessageMailer.delay.new_adopt_message(@adopt_message, pet.user, pet.name_formatted, pet.adopt_specie_url)
      redirect_to pet.adopt_specie_path, notice: t('.notice')
    else
      errors = @adopt_message.errors.full_messages
      redirect_to pet.adopt_specie_path(@adopt_message.to_param), alert: errors
    end
  end

  private
    def set_pet
      @pet = Pet.includes(:pet_pictures).find(params[:id])
      authorize @pet
    end

    def set_adopt_message
      @adopt_message = AdoptMessage.new adopt_message_params
    end

    def redirect_pet
      unless pet.adopt_specie_path == request.path
        redirect_to pet.adopt_specie_path, status: 301
      end
    end

    def pet_params
      params.require(:pet).permit(:age, :breed, :description, :location,
                                  :more_info_url, :name, :sex, :size, :specie,
                                  :urgent, :province_id, :status,
                                  pet_pictures_attributes: [:asset, :_destroy, :id])
    end

    def adopt_message_params
      if params[:adopt_message].present?
        params.require(:adopt_message).permit(:email, :body)
      end
    end
end
