Rails.application.routes.draw do

  mount ForestLiana::Engine => '/forest'
  get '/contact' => 'contact_messages#new', as: :new_contact
  post '/contact' => 'contact_messages#create'

  resources :imported_pets do
    collection do
      get :process_update
    end
  end

  resources :shelters, path: 'protectoras-de-animales'
  resources :pets, only: [:new, :create, :edit, :update, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root :to => 'home#index'

  post '/find' => 'home#find', as: :find
  get '/en-adopcion/:specie(/:province)(/:breed)' => 'home#index', as: :adopt_species
  get '/en-adopcion/:specie/:province/:breed/:id' => 'pets#show', as: :adopt_specie
  post '/en-adopcion/:specie/:province/:breed/:id/adopt' => 'pets#adopt', as: :adopt_pet
  get '/en-adopcion', to: redirect('/')

  match '/404', to: 'errors#file_not_found', via: :all
end
