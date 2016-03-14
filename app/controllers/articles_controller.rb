class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html, :json
  responders :flash

  def index
    if params[:tag].present?
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
      respond_with(@articles)
    end
  end

  def show
    @comments = Comment.where(article_id: @article.id).order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      respond_with(@article)
    else
      render 'new'
    end
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:user_id, :name, :image, :content, tag_list: [], category_ids: [])
    end
end
