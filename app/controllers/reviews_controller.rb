class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_product
  before_action :authenticate_user!
  respond_to :html, :json
  # responders :flash

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id

    if @review.save
      flash[:notice] = "Review was successfully created."
      respond_with(@product)
    else
      render 'new'
    end
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "Review was successfully updated."
      respond_with(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = "Review was successfully destroyed."
    respond_with(@product)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
