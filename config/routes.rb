Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :barbecues do
    collection do
      post :search
    end
  end
  resources :users, only: %i[new create]
  resources :locations, only: %i[index create update]
  get 'users/:id/booking/', to: 'barbecues#booking', as: :booking
end
