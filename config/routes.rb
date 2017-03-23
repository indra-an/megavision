Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins

  get 'jobs/:slug_id' => 'home#job_detail', :as => :public_job_vacancy_detail

  namespace :admins do
    get 'dashboard' => 'dashboard#index'

    put 'update_password' => 'dashboard#update_password'

    resources :vacancies
  end
end
