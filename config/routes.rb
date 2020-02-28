Rails.application.routes.draw do
  resources :users do
    resources :practices, only: [:index]
  end

  resources :practices do
    resources :locations, only: [:index]
  end

  resources :locations

  get '/location_search', to: 'locations#search' 
end
