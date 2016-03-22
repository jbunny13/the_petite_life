class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  respond_to :html, :json
  responders :flash

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      respond_with(@category)
    else
      render 'new'
    end
  end

  def update
    @category.slug = nil
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
      redirect_to action: 'show', id: @category.friendly_id, status: 301 unless @category.friendly_id == params[:id]
    end

    def category_params
      params.require(:category).permit(:name, :slug)
    end
end
