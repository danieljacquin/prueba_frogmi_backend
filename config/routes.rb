Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :features do
    get 'index', on: :collection
    get 'get_and_save_features', on: :collection
    # Define other custom routes if needed
  end
  resources :comments do
    post 'create', on: :collection
    get 'find_by_feature_id', on: :collection
  end

end
