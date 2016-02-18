class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html, :json
  responders :flash

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")
    # TODO: decide which implementation to use
    # @product = Product.find(params[:id])
    # @review = @product.reviews.build
    # @reviews = @product.reviews
    # respond_with(@product)
  end

  def new
    @product = Product.new
    # respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_with(@product) if @product.save
    # TODO: decide which implementation to use
    # if @product.save
    #   redirect_to @product
    # else
    #   render 'new'
    # end
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def popular
    @products = Product.all
    respond_with(@products)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :category, :description, :image)
    end
end
