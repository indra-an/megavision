Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins

  namespace :admins do
    get 'dashboard' => 'dashboard#index'

    put 'update_password' => 'dashboard#update_password'
  end
end
