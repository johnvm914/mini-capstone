Rails.application.routes.draw do
  get "/all_products", to: "products#all_products_method"
end
