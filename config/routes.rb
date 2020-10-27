Rails.application.routes.draw do
  resources :opinions, only: [:index, :new, :create] do
    resources :comments, only: [:create]
  end
  devise_for :users

  resources :following, only: [:create, :destroy]

  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'

  root 'opinions#index'
end
