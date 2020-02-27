Rails.application.routes.draw do
  resources :users do
    resources :practices, only: [:index] do
      resources :locations, only: [:index]
    end
  end
end
