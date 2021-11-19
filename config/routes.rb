# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
    end
  end

  resources :likes, only: %i[create]

  namespace :api do
      resources :posts, only: %i[index show new create destroy]
  end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
