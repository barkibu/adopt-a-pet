require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ImportedPetsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # ImportedPet. As you add validations to ImportedPet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ImportedPetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  login_admin

  describe 'GET index' do
    it 'assigns all imported_pets as @imported_pets' do
      imported_pet = ImportedPet.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:imported_pets)).to eq([imported_pet])
    end
  end

  describe 'GET show' do
    it 'assigns the requested imported_pet as @imported_pet' do
      imported_pet = ImportedPet.create! valid_attributes
      get :show, { id: imported_pet.to_param }, valid_session
      expect(assigns(:imported_pet)).to eq(imported_pet)
    end
  end

  describe 'GET new' do
    it 'assigns a new imported_pet as @imported_pet' do
      get :new, {}, valid_session
      expect(assigns(:imported_pet)).to be_a_new(ImportedPet)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested imported_pet as @imported_pet' do
      imported_pet = ImportedPet.create! valid_attributes
      get :edit, { id: imported_pet.to_param }, valid_session
      expect(assigns(:imported_pet)).to eq(imported_pet)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new ImportedPet' do
        expect do
          post :create, { imported_pet: valid_attributes }, valid_session
        end.to change(ImportedPet, :count).by(1)
      end

      it 'assigns a newly created imported_pet as @imported_pet' do
        post :create, { imported_pet: valid_attributes }, valid_session
        expect(assigns(:imported_pet)).to be_a(ImportedPet)
        expect(assigns(:imported_pet)).to be_persisted
      end

      it 'redirects to the created imported_pet' do
        post :create, { imported_pet: valid_attributes }, valid_session
        expect(response).to redirect_to(ImportedPet.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved imported_pet as @imported_pet' do
        post :create, { imported_pet: invalid_attributes }, valid_session
        expect(assigns(:imported_pet)).to be_a_new(ImportedPet)
      end

      it "re-renders the 'new' template" do
        post :create, { imported_pet: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested imported_pet' do
        imported_pet = ImportedPet.create! valid_attributes
        put :update, { id: imported_pet.to_param, imported_pet: new_attributes }, valid_session
        imported_pet.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested imported_pet as @imported_pet' do
        imported_pet = ImportedPet.create! valid_attributes
        put :update, { id: imported_pet.to_param, imported_pet: valid_attributes }, valid_session
        expect(assigns(:imported_pet)).to eq(imported_pet)
      end

      it 'redirects to the imported_pet' do
        imported_pet = ImportedPet.create! valid_attributes
        put :update, { id: imported_pet.to_param, imported_pet: valid_attributes }, valid_session
        expect(response).to redirect_to(imported_pet)
      end
    end

    describe 'with invalid params' do
      it 'assigns the imported_pet as @imported_pet' do
        imported_pet = ImportedPet.create! valid_attributes
        put :update, { id: imported_pet.to_param, imported_pet: invalid_attributes }, valid_session
        expect(assigns(:imported_pet)).to eq(imported_pet)
      end

      it "re-renders the 'edit' template" do
        imported_pet = ImportedPet.create! valid_attributes
        put :update, { id: imported_pet.to_param, imported_pet: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested imported_pet' do
      imported_pet = ImportedPet.create! valid_attributes
      expect do
        delete :destroy, { id: imported_pet.to_param }, valid_session
      end.to change(ImportedPet, :count).by(-1)
    end

    it 'redirects to the imported_pets list' do
      imported_pet = ImportedPet.create! valid_attributes
      delete :destroy, { id: imported_pet.to_param }, valid_session
      expect(response).to redirect_to(imported_pets_url)
    end
  end
end
