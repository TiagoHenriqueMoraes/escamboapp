Rails.application.routes.draw do
  namespace :site do
    get 'home/index'
  end

  namespace :backoffice do
    get 'dashboard/index'
  end


  devise_for :admins
  devise_for :members
  #devise_for :installs
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
