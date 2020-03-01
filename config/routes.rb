Rails.application.routes.draw do
  resources :users do
    resources :practices, only: [:index]
  end

  resources :practices do
    resources :locations, only: [:index]
  end

  resources :locations

  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"

  get '/location_search', to: 'locations#search'
end
