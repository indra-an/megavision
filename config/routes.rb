Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins

  get 'jobs/:slug_id' => 'home#job_detail', :as => :public_job_vacancy_detail
  get 'channels/:slug_id' => 'home#channel_detail', :as => :public_channel_detail
  get 'check_area' => 'home#check_area', :as => :public_check_area
  get 'subscribe/:slug_id/:package_id/:price_id' => 'home#subscribe', :as => :public_subscribe
  get 'autocomplete_area' => 'home#autocomplete_area', :as => :public_autocomplete_area
  post 'submit_contact' => 'home#submit_contact', :as => :public_submit_contact

  namespace :admins do
    get 'dashboard' => 'dashboard#index'
    get 'preferences' => 'dashboard#preferences'
    get 'area_coverages' => 'dashboard#area_coverages'
    get 'chats' => 'dashboard#chats'

    put 'update_password' => 'dashboard#update_password'

    post 'preferences' => 'dashboard#save_preferences'
    post 'area_coverages' => 'dashboard#save_area_coverages'

    delete 'area_coverages/:id' => 'dashboard#destroy_area_coverage', :as => :destroy_area_coverage

    resources :contacts, :except => [:new, :create, :edit, :update]
    resources :channels, :except => [:show]
    resources :channel_cities, :except => [:show] do
      resources :types, :only => [:index, :edit, :update] do
        resources :channel_packages, only: [:index, :edit, :update]
      end
    end
    resources :channel_groups, :except => [:show]
    resources :channel_types, :except => [:show]
    resources :packages, :except => [:new, :show, :destroy]
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
