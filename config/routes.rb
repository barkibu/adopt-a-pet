Rails.application.routes.draw do

  resources :pets, only: [:new, :create, :edit, :update, :destroy]

  ActiveAdmin.routes(self)
  devise_for :users
  root :to => 'home#index'
end
