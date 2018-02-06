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

RSpec.describe PetsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Pet. As you add validations to Pet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'MyString',
      specie: :dog,
      breed: 'MyString',
      sex: :male,
      description: 'MyString',
      shelter_name: 'MyString',
      location: 'MyString',
      province_id: 46
    }
  end

  let(:invalid_attributes) do
    {
      name: 'MyString',
      specie: '',
      breed: 'MyString',
      description: nil,
      location: 'MyString'
    }
  end

  describe 'GET show' do
    it 'assigns the requested pet as @pet' do
      pet = Pet.create! valid_attributes
      get :show,
          id: pet.to_param,
          specie: pet.enum_to_s(:specie).parameterize,
          province: pet.province,
          breed: pet.breed.parameterize
      expect(assigns(:pet)).to eq(pet)
    end
  end

  context 'with a shelter logged' do
    login_shelter

    describe 'GET new' do
      it 'assigns a new pet as @pet' do
        get :new
        expect(assigns(:pet)).to be_a_new(Pet)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested pet as @pet' do
        pet = Pet.create! valid_attributes
        get :edit, id: pet.to_param
        expect(assigns(:pet)).to eq(pet)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Pet' do
          expect do
            post :create, pet: valid_attributes
          end.to change(Pet, :count).by(1)
        end

        it 'assigns a newly created pet as @pet' do
          post :create, pet: valid_attributes
          expect(assigns(:pet)).to be_a(Pet)
          expect(assigns(:pet)).to be_persisted
        end

        it 'redirects to the created pet' do
          post :create, pet: valid_attributes
          expect(response).to redirect_to(Pet.last.decorate.adopt_specie_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved pet as @pet' do
          post :create, pet: invalid_attributes
          expect(assigns(:pet)).to be_a_new(Pet)
        end

        it "re-renders the 'new' template" do
          post :create, pet: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end
  end

  context 'with an admin logged' do
    login_admin

    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_attributes) do
          skip('Add a hash of attributes valid for your model')
        end

        it 'updates the requested pet' do
          pet = Pet.create! valid_attributes
          put :update, id: pet.to_param, pet: new_attributes
          pet.reload
          skip('Add assertions for updated state')
        end

        it 'assigns the requested pet as @pet' do
          pet = Pet.create! valid_attributes
          put :update, id: pet.to_param, pet: valid_attributes
          expect(assigns(:pet)).to eq(pet)
        end

        it 'redirects to the pet' do
          pet = Pet.create! valid_attributes
          put :update, id: pet.to_param, pet: valid_attributes
          expect(response).to redirect_to(pet.decorate.adopt_specie_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns the pet as @pet' do
          pet = Pet.create! valid_attributes
          put :update, id: pet.to_param, pet: invalid_attributes
          expect(assigns(:pet)).to eq(pet)
        end

        it "re-renders the 'edit' template" do
          pet = Pet.create! valid_attributes
          put :update, id: pet.to_param, pet: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested pet' do
        pet = Pet.create! valid_attributes
        expect do
          delete :destroy, id: pet.to_param
        end.to change(Pet, :count).by(-1)
      end

      it 'redirects to the pets list' do
        pet = Pet.create! valid_attributes
        delete :destroy, id: pet.to_param
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
