class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  respond_to :html, :json
  responders :flash

  def index 
    @products = Product.includes(:reviews).where(nil)

    sort = params[:sort]
    case sort
      when 'most_recent'
        @products = @products.most_recent
      when 'by_name'
        @products = @products.by_name
      when 'average_rating'
        @products = @products.average_rating
      else
        @products
    end

    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    if @product.save
      respond_with(@product)
    else
      render 'new'
    end
  end

  def update
    @product.slug = nil
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.friendly.find(params[:id])
      redirect_to action: 'show', id: @product.friendly_id, status: 301 unless @product.friendly_id == params[:id]
    end

    def product_params
      params.require(:product).permit(:user_id, :name, :description, :image, :slug, :sort, tag_list: [], category_ids: [])
    end
end
