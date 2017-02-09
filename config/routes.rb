Rails.application.routes.draw do
  get "/products", to: "products#index"
  get "/products/new", to: "products#new"
  get "/products/:id", to: "products#show"
  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"
  post "/products", to: "products#create"
  delete "/products/:id", to: "products#destroy"

  get "/suppliers", to: "suppliers#index"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  post "/orders", to: "orders#create"
  get "/orders/:id", to: "orders#show"

  get "/carted_products", to: "carted_products#index"
  post "/carted_products", to: "carted_products#create"
  delete "carted_products/:id", to: "carted_products#destroy"
end
