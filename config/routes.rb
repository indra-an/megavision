Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins

  get 'jobs/:slug_id' => 'home#job_detail', :as => :public_job_vacancy_detail
  get 'channels/:slug_id' => 'home#channel_detail', :as => :public_channel_detail
  post 'submit_contact' => 'home#submit_contact', :as => :public_submit_contact

  namespace :admins do
    get 'dashboard' => 'dashboard#index'
    get 'preferences' => 'dashboard#preferences'

    put 'update_password' => 'dashboard#update_password'

    post 'preferences' => 'dashboard#save_preferences'

    resources :contacts, :except => [:new, :create, :edit, :update]
    resources :channels, :except => [:show]
    resources :channel_cities, :except => [:show]
    resources :prices, :except => [:show]
    resources :questions
    resources :vacancies
    resources :admins, :except => [:edit, :update, :show]
    resources :landing_images do
      get 'make_draft'
      get 'make_published'
    end
  end
end
