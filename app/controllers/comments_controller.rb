class CommentsController < ApplicationController
  before_action :set_comment, only: [:index, :edit, :update, :destroy]
  before_action :set_article
  before_action :authenticate_user!
  load_and_authorize_resource except: :index

  respond_to :html, :json, :js

  def index
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = @article.id

    if @comment.save
      flash[:notice] = "Comment was successfully created."
      respond_with(@article)
    else
      render 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment was successfully updated."
      respond_with(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment was successfully destroyed."
    respond_with(@article)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_article
      @article = Article.friendly.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :content)
    end
end
