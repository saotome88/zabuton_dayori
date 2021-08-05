Rails.application.routes.draw do
  devise_for :users

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