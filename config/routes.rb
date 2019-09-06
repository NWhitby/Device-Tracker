Rails.application.routes.draw do
  root 'welcome#home'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/devices/recent', to: 'devices#recent'   
  
  resources :users, only: [:new, :create, :show] do
    resources :devices, only: [:index, :new, :create, :show, :update]
  end
  
  resources :devices, only: [:show, :edit, :update, :destroy] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
