Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root 'home#index'

  devise_for :admins

  get 'jobs/:slug_id' => 'home#job_detail', :as => :public_job_vacancy_detail
  get 'channels/:slug_id' => 'home#channel_detail', :as => :public_channel_detail
  get 'channels/:slug_id/:area_slug_id' => 'home#channel_detail', :as => :public_channel_detail_list
  get 'check_area' => 'home#check_area', :as => :public_check_area
  get 'subscribe/:slug_id/:package_id/:price_id' => 'home#subscribe', :as => :public_subscribe
  get 'autocomplete_area' => 'home#autocomplete_area', :as => :public_autocomplete_area
  post 'submit_contact' => 'home#submit_contact', :as => :public_submit_contact
  post 'submit_subscribe' => 'home#submit_subscribe', :as => :public_submit_subscribe

  namespace :admins do
    get 'dashboard' => 'dashboard#index'
    get 'preferences' => 'dashboard#preferences'
    get 'chats' => 'dashboard#chats'
    get 'admin_logs' => 'dashboard#admin_logs'

    put 'update_password' => 'dashboard#update_password'

    post 'preferences' => 'dashboard#save_preferences'
    # post 'area_coverages' => 'dashboard#save_area_coverages'

    # delete 'area_coverages/:id' => 'dashboard#destroy_area_coverage', :as => :destroy_area_coverage

    resources :area_coverages do
      collection do
        get :import
        get :download_template
        post :import_area
      end
    end
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
    resources :area_codes
    resources :menu_settings
  end
end
