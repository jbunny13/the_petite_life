class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  respond_to :html, :json, :js
  
  def index
    @tags = ActsAsTaggableOn::Tag.order(name: :asc)
  end

  def show
    @articles = Article.tagged_with(@tag).order(created_at: :desc).page(params[:article]).per(4)
    @products = Product.includes(:reviews).tagged_with(@tag).order(created_at: :desc).page(params[:product]).per(4)
    @references = Reference.tagged_with(@tag).order(created_at: :desc).page(params[:resource]).per(4)
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
    redirect_to tags_path
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
