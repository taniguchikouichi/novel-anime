Rails.application.routes.draw do
  namespace :admin do
    get 'user_admin/new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
