class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  responders :flash

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.all
    @product = Product.new(product_params)
    @product.save
    respond_with(@product)

    # if @product.save
    #   redirect_to @product
    # else
    #   render 'new'
    # end
  end

  def update
    @product.update(product_params)
    respond_with(@product)

    # if @product.update(product_params)
    #   redirect_to @product
    # else
    #   render 'edit'
    # end
  end

  def destroy
    @product.destroy
    respond_with(@product)

    # redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :category, :description)
    end
end
