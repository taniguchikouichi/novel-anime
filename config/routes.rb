Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/password',
    registrations: 'users/registrations'
  }  
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/password',
      registrations: 'admins/registrations'
    }  
  resources :users, only: [:show, :edit, :destoroy, :update]
  resources :novels, only: [:index, :show] do
    resources :reviews, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  end
  resources :favorites, only: [:index, :create, :index]
  get 'novels/:id/favorite' => 'novels#favorite', as: "favorite_novels"
  get  'rank' => 'novels#ranks'
  get 'search', to: 'novels#search'



  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :genres, only: [:new, :index, :create, :destroy]
    resources :labels, only: [:new, :index, :create, :destroy]
    resources :novels, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :reviews, only: [:index, :edit, :update, :destroy]
    end
    get  'top' => 'homes#top'
    get  'out/users/:id', to: 'users#out', as: :out
    get  'ranks' => 'novels#rank'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end