class ImportedPetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_imported_pet, only: %i[show edit update destroy]
  after_action :verify_authorized

  decorates_assigned :imported_pets
  decorates_assigned :imported_pet

  def index
    @imported_pets = ImportedPet.without_pet.all
    authorize ImportedPet
  end

  def process_update
    @imported_pets = ImportedPet.without_pet
    authorize ImportedPet

    imported_pets.each do |decorated_imported_pet|
      json_object = decorated_imported_pet.data_to_json
      imported_pet = decorated_imported_pet.model
      pet_factory = Tentacles::PetFactory.new(json_object, imported_pet)
      pet_factory.delay.update
    end

    redirect_to imported_pets_url, notice: 'Processing the imported pets in background'
  end

  def show; end

  def new
    @imported_pet = ImportedPet.new
    authorize @imported_pet
  end

  def edit; end

  def create
    @imported_pet = ImportedPet.new(imported_pet_params)
    authorize @imported_pet

    if @imported_pet.save
      redirect_to @imported_pet, notice: 'Imported pet was successfully created.'
    else
      render :new
    end
  end

  def update
    if imported_pet.update(imported_pet_params)
      unless imported_pet.pet
        pet_factory = Tentacles::PetFactory.new(imported_pet.data_to_json, imported_pet)
        pet_factory.update
      end

      redirect_to imported_pets_url, notice: 'Imported pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize imported_pet
    imported_pet.destroy
    redirect_to imported_pets_url, notice: 'Imported pet was successfully destroyed.'
  end

  private

  def set_imported_pet
    @imported_pet = ImportedPet.find(params[:id])
    authorize @imported_pet
  end

  def imported_pet_params
    params.require(:imported_pet).permit(:pet_id, :data, :logs)
  end
end
