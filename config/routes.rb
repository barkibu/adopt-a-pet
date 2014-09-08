Rails.application.routes.draw do

  resources :pets

  ActiveAdmin.routes(self)
  devise_for :users
  root :to => 'home#index'
end
