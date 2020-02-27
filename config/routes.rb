Rails.application.routes.draw do
  resources :users do
    resources :practices, only: [:index]
  end

  resources :practices do
    resources :locations, only: [:index]
  end
  resources :locations
end
