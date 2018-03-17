Rails.application.routes.draw do
  root to: 'projects#index' 
  get 'welcome', to: 'welcome#index'
  devise_for :users
  resources :users do
    resources :projects do
      resources :bugs
    end
  end
end
