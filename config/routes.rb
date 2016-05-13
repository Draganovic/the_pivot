Rails.application.routes.draw do
  get    "/login",                 to: "sessions#new"
  post   "/login",                 to: "sessions#create"
  delete "/logout",                to: "sessions#destroy"
  root   "welcome#show"
  #
  # get    "/homes/:id",             to: "homes#show"
  # get    "/coders/:id",            to: "coders#show",           as: :coder
  # get    "/coders",                to: "coders#index",          as: :coders


  get    "/users/new",             to: "users#new",             as: :new_user
  post   "/users",                 to: "users#create",          as: :users
  get    "/dashboard",             to: "users#show",            as: :dashboard


  namespace :api do
    namespace :v1 do
      post "/reservations", to: "reservations#create"
    end
  end

  # post   "/contracts",             to: "contracts#create",      as: :contracts
  # get    "/contract/:id",          to: "contracts#show",        as: :contract
  # get    "/teams",                 to: "teams#index",           as: :teams
  # post   "/teams",                 to: "teams#create"
  # delete "/teams/:id",             to: "teams#destroy",         as: :team
  #
  # get    "/admin/dashboard",       to: "admin/users#show",      as: :admin_dashboard
  # get    "/admin/users/:id/edit",  to: "admin/users#edit",      as: :edit_admin_user
  # patch  "/admin/users/:id",       to: "admin/users#update",    as: :admin_user
  # get    "/admin/contracts/:id",   to: "admin/contracts#show",  as: :admin_contract
  # get    "/admin/contracts",       to: "admin/contracts#index", as: :admin_contracts
  # get    "/admin/coders",          to: "admin/coders#index",    as: :admin_coders
  # get    "/admin/coders/:id/edit", to: "admin/coders#edit",     as: :edit_admin_coder
  # patch  "/admin/coders/:id",      to: "admin/coders#update",   as: :admin_coder
  #
  # get    "/history",               to: "contracts#index"

  get    "/:city/homes/:id",       to: "homes#show",        as: :home
  resources :homes, only: [:edit, :update]
  get    "/:city",                 to: "cities#show",       as: :city
end
