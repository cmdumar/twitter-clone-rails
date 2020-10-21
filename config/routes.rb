Rails.application.routes.draw do
  resources :opinions
  devise_for :users

  resources :following, only: [:create, :destroy]

  get 'users/:id' => 'users#show'

  root 'opinions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
