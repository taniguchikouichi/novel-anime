Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  
  resources :users, only: [:index, :show, :edit, :destoroy, :update]
  resources :novels, only: [:index, :show]
  resources :reviews, only: [:index, :show, :new, :edit, :create, :update]
  resources :favorites, only: [:index, :create, :index]

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :novels, only: [:index, :show, :new, :edit, :create, :update, :destoroy]
    resources :genres, only: [:new, :index, :create, :destroy]
    resources :labels, only: [:new, :index, :create, :destroy]
    resources :reviews, only: [:index, :destroy]
    get  'top' => 'homes#top'
    get  'out/users/:id', to: 'users#out', as: :out

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end