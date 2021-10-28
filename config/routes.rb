# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
