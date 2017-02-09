class OrdersController < ApplicationController
  def create
    @order = Order.new(user_id: current_user.id)
    carted_products = current_user.carted_products.where(status: "carted")
    @order.subtotal = 0
    carted_products.each do |carted_product|
      @order.subtotal += carted_product.product.price * carted_product.quantity
    end
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax
    @order.save
    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = @order.id
      carted_product.save
    end
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user == current_user
      render "show.html.erb"
    else
      redirect_to "/products"
    end
  end
end
