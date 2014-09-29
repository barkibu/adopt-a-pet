Rails.application.routes.draw do

  resources :imported_pets

  resources :shelters, path: 'protectoras-de-animales'
  resources :pets, only: [:new, :create, :edit, :update, :destroy]

  ActiveAdmin.routes(self)
  devise_for :users

  root :to => 'home#index'
  post '/find' => 'home#find', as: :find
  get '/en-adopcion/:specie(/:province)(/:breed)' => 'home#adopt', as: :adopt_species
  get '/en-adopcion/:specie/:province/:breed/:id' => 'pets#show', as: :adopt_specie
  get '/en-adopcion', to: redirect('/')

  match '/404', to: 'errors#file_not_found', via: :all
end
