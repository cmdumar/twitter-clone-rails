Rails.application.routes.draw do
  resources :opinions, only: [:index, :new, :create] do
    resources :comments, only: [:create]
  end
  devise_for :users

  resources :following, only: [:create, :destroy]

  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'

  root 'opinions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
