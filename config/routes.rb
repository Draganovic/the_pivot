Rails.application.routes.draw do
  root "homes#show"
  resources :homes, only: [:show]

  resources :coders, only: [:index, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]

  resources :contracts, only: [:create, :show]

  get "/history", to: "contracts#index"

  resources :teams, only: [:create, :index, :destroy]

  get "/:slug", to: "categories#show", as: :category
  # resources :categories, only: [:show]
end
