Rails.application.routes.draw do
  get 'sessions/new'
  resources :realms
  resources :statuses
  # resources :comments
  resources :ideas do
    resources :comments
    resources :ratings
  end
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "ideas#index"
end
