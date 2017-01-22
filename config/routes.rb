Rails.application.routes.draw do
  get "/products", to: "products#index"
  get "/products/new", to: "products#new"
  get "/products/:id", to: "products#show"
  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"
  post "/products", to: "products#create"
  delete "products/:id", to: "products#destroy"
end
