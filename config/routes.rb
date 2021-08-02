Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :users, only: [:show]
  resources :memos, only: [:create]

  resources :events, only: [:index, :show] do
    resources :reaction_likes, only: [:create, :destroy]
  end

  namespace :admin do
    resources :events, only: [:new, :create, :destroy, :update, :edit]
  end
end