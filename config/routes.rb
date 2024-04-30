Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/bienvenida", to: "home#index"

  root to: "home#index"

  resources :articles do
    get "/user/:user_id", to: "articles#from_author", on: :collection
  end

  # get "/articles", to: "articles#index"
  # get "/articles/new", to: "articles#new", as: :new_articles
  # get "/articles/:id", to: "articles#show"
  # get "/articles/:id/edit", to: "articles#edit"
  # patch "/articles/:id", to: "articles#update", as: :article
  # post "/articles", to: "articles#create"
  # delete "/articles/:id", to: "articles#destroy"

end
