Rails.application.routes.draw do
  get 'sessions/new'
  # resources :realms
  # resources :statuses
  # resources :comments
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'

  scope '(:locale)', locale: /en|mi/ do
    resources :ideas do
      member do
        post 'toggle_bookmark', to: 'ideas#toggle_bookmark'
      end
      resources :comments
      resources :ratings
    end
    get 'leaderboards', to: 'leaderboards#show'
    get ':page' => 'static#show'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'ideas#index'
end
