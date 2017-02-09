class ProductsController < ApplicationController
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]
  def index
    sort_attribute = params[:sort]
    sort_order = params[:order]
    max_price = params[:price]
    category_name = params[:category]
    product_name = params[:name]
    if sort_attribute
      @products = Product.order(sort_attribute => sort_order)
    elsif max_price
      @products = Product.where("price < ?", max_price)
    elsif category_name
      selected_category = Category.find_by(name: category_name)
      @products = selected_category.products
    elsif product_name
      @products = Product.where("name LIKE ?", "%#{product_name}%")
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
    @product = Product.new
    render "new.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name], price: params[:price], description: params[:description])
    if @product.save
      flash[:success] = "Product has been updated!"
      redirect_to "/products/#{@product.id}"
    else
      flash[:error] = "Try again!"
      render "edit.html.erb"
    end
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description], supplier_id: params[:supplier_id])
    if @product.save
      @product.images.create(url: params[:image])
      flash[:info] = "Product has been created!"
      redirect_to "/products/#{@product.id}"
    else
      flash[:error] = "Try again!"
      render "new.html.erb"
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product has been deleted!"
    redirect_to "/products/"
  end

end
