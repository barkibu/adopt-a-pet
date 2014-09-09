Rails.application.routes.draw do

  resources :pets, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
      post :find
    end
  end

  ActiveAdmin.routes(self)
  devise_for :users
  root :to => 'home#index'
end
