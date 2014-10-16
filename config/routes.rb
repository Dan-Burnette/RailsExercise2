Rails.application.routes.draw do
 
 resources :users, :cohorts do
  resources :memberships, :only => [:create, :destroy]
 end

 root to: 'users#index'

end
