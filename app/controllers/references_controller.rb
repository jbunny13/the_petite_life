class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  respond_to :html, :json, :js
  responders :flash

  def index
    @references = Reference.where(nil)
    sort = params[:sort]
    case sort
      when 'by_name'
        @references = @references.page(params[:pageish]).per(5)
      when 'most_recent'
        @references = @references.most_recent.page(params[:page]).per(5)
      else
        @references = @references.page(params[:page]).per(5)
    end
    respond_with(@references)
  end

  def show
    respond_with(@reference)
  end

  def new
    @reference = Reference.new
    respond_with(@reference)
  end

  def edit
  end

  def create
    @reference = Reference.new(reference_params)
    @reference.user_id = current_user.id
    
    if @reference.save
      respond_with(@reference)
    else
      render 'new'
    end
  end

  def update
    @reference.slug = nil
    @reference.update(reference_params)
    respond_with(@reference)
  end

  def destroy
    @reference.destroy
    redirect_to references_path
  end

  private
    def set_reference
      @reference = Reference.friendly.find(params[:id])
      redirect_to action: 'show', id: @reference.friendly_id, status: 301 unless @reference.friendly_id == params[:id]
    end

    def reference_params
      params.require(:reference).permit(:name, :uri, :user_id, :slug, tag_list: [], category_ids: [])
    end
end
