Rails.application.routes.draw do
  # root to: 'landing#index'
  root to: 'projects#index'
  resources :bugs
  resources :projects
  devise_for :users
end
