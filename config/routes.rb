Rails.application.routes.draw do
  resources :opinions
  devise_for :users

  get 'users/:id' => 'users#show'

  post "follow/account" => "users#follow_account", as: :follow_account

  root 'opinions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
