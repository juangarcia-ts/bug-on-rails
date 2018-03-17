Rails.application.routes.draw do
  # root to: 'landing#index'
  root to: 'projects#index' 
  devise_for :users
  resources :users do
    resources :projects do
      resources :bugs
    end
  end
end
