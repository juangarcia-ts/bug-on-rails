Rails.application.routes.draw do
  root to: 'landing#index'
  resources :bugs
  resources :projects
  devise_for :users
end
