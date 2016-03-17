class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  respond_to :html, :json
  responders :flash

  def index
    tag = params[:tag]
    @references = tag.present? ? Reference.tagged_with(tag) : Reference.all
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
    @reference.update(reference_params)
    respond_with(@reference)
  end

  def destroy
    @reference.destroy
  end

  private
    def set_reference
      @reference = Reference.find(params[:id])
    end

    def reference_params
      params.require(:reference).permit(:name, :uri, :user_id, tag_list: [], category_ids: [])
    end
end
