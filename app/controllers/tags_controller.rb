class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]
  
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @articles = Article.tagged_with(@tag)
    @products = Product.tagged_with(@tag)
    @references = Reference.tagged_with(@tag)
  end

  def edit
  end

  def update
    @tag.slug = nil
    @tag.update(tag_params)
    respond_with(@tag)
  end

  def destroy
    @tag.destroy
  end

  private
    def set_tag
      @tag = ActsAsTaggableOn::Tag.friendly.find(params[:id])
      redirect_to action: 'show', id: @tag.friendly_id, status: 301 unless @tag.friendly_id == params[:id]
    end

    def tag_params
      params.require(:tag).permit(:name, :taggings_count, :slug)
    end
end
