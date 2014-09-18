Rails.application.routes.draw do

  resources :shelters, path: 'protectoras-de-animales'
  resources :pets, only: [:new, :create, :edit, :update, :destroy]

  ActiveAdmin.routes(self)
  devise_for :users

  root :to => 'home#index'
  post '/find' => 'home#find', as: :find
  get '/en-adopcion/:specie(/:location)(/:breed)' => 'home#adopt', as: :adopt_species
  get '/en-adopcion/:specie/:location/:breed/:id' => 'pets#show', as: :adopt_specie
end
