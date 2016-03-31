class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  respond_to :html, :json, :js
  responders :flash

  def index
    @articles = Article.where(nil)
    sort = params[:sort]
    case sort
      when 'by_name'
        @articles = @articles.by_name.page(params[:page]).per(8)
      when 'most_recent'
        @articles = @articles.most_recent.page(params[:page]).per(8)
      else
        @articles = @articles.page(params[:page]).per(8)
    end
    respond_with(@articles)
  end

  def show
    @comments = @article.comments.order(created_at: :desc).page(params[:page]).per(10)
    respond_with(@article)
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
    @article.slug = nil
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
      redirect_to action: 'show', id: @article.friendly_id, status: 301 unless @article.friendly_id == params[:id]
    end

    def article_params
      params.require(:article).permit(:user_id, :name, :image, :content, :slug, tag_list: [], category_ids: [])
    end
end
