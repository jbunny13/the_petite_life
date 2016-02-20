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

    if @reviews.blank?
      @average_review = 0
    else
      @average_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      respond_with(@product)
    else
      render 'new'
    end
  end

  def update
    @product.update(product_params)
    respond_with(@product)
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
