Rails.application.routes.draw do
  root 'users#index'

  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
