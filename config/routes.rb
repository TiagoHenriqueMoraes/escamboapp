Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'
  
  namespace :backoffice do
    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show]
    resources :send_mail, only: [:edit, :create]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index]
    end

  end

  devise_for :admins, :skip => [:registration]
  devise_for :members
  #devise_for :installs
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
