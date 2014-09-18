Rails.application.routes.draw do

  resources :shelters

  resources :pets, only: [:show, :new, :create, :edit, :update, :destroy]

  post '/find' => 'home#find', as: :find

  ActiveAdmin.routes(self)
  devise_for :users
  root :to => 'home#index'

  get '/en-adopcion/:specie(/:location)(/:breed)' => 'home#adopt', as: :adopt_species
  get '/en-adopcion/:specie/:location/:breed/:id' => 'pets#show', as: :adopt_specie
end
