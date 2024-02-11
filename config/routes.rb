Rails.application.routes.draw do
  # Devise routes for User model
  devise_for :users

  # After login, the user is redirected to routines index
  # Assuming you have a Dashboard or similar controller to handle authenticated root
  authenticated :user do
    root 'routines#index', as: :authenticated_root
  end

  # Unauthenticated root (if user is not logged in, they'll see this)
  root 'welcome#index'

  

  # Routines routes
  resources :routines do
    # Nested resource for exercises within a routine
    resources :exercises, only: [:create, :new, :destroy, :edit, :update]
    get 'date_lookup/:date', on: :collection, to: 'routines#date_lookup', as: :date_lookup
  end
  
  # Optionally, if you want a user to be able to view their exercises separately
  # you can also have:
  resources :exercises, only: [:index, :show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
