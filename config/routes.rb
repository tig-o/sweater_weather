Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'

      post '/users', to: 'users#create'

      post '/sessions', to: 'users#user_login'

      post '/road_trip', to: 'road_trip#index'

      get '/backgrounds', to: 'image#index'
    end
  end
end
