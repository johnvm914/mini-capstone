class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "carted")
    @carted_product.save
    redirect_to "/carted_products"
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products == []
      redirect_to "/products"
    else
      render "index.html.erb"
    end
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
  end

end
