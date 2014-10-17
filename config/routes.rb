Rails.application.routes.draw do
 
 devise_for :users

 resources :users, :cohorts do
  resources :memberships, :only => [:create, :destroy]
 end

 root to: 'application#index'

end
