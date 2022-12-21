# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create, :index, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
