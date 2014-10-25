Rails.application.routes.draw do

  root to: 'reader#show'
  
  resource :reader, controller: :reader, only: [:show]
  resources :channels, only: [:new, :create, :destroy] do
    member do
      get :avatar
    end
  end
  resources :items, only: [:update]
  
end
