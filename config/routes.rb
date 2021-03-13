Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :barbecues do
    # get 'booking', to: 'barbecues#booking'
    resources :locations, only: %i[new create]
    collection do
      post :search
    end
  end
  resources :users, only: %i[new create]

  resources :locations, only: %i[show index update destroy] do
    resources :reviews, only: %i[new create]
  end
  get 'users/:id/booking/', to: 'barbecues#booking', as: :booking
end
