Rails.application.routes.draw do
 
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :destroy]
      post '/auth/login', to: 'authentication#login'

      resources :vehicles, only: [:index, :create, :show, :destroy]

      resources :reservations, only: [:index, :create, :show, :destroy]
      get '/all_reservations', to: 'reservations#all_reservations'
    end
  end
end
