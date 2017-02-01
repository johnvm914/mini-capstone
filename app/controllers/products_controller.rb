class ProductsController < ApplicationController

  def index
    sort_attribute = params[:sort]
    sort_order = params[:order]
    max_price = params[:price]
    if sort_attribute
      @products = Product.order(sort_attribute => sort_order)
    elsif max_price
      @products = Product.all.where("price < ?", max_price)
    else
      @products = Product.all
    end
    render "index.html.erb"
  end

  def show
    if params[:id] == "random_product"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @product.save
    flash[:success] = "Product has been updated!"
    redirect_to "/products/#{@product.id}"
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description], supplier_id: params[:supplier_id])
    @product.save
    flash[:info] = "Product has been created!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product has been deleted!"
    redirect_to "/products/"
  end

end
