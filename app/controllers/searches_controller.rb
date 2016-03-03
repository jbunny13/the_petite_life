class SearchesController < ApplicationController
  respond_to :html, :json

  def index
    # if params[:query].present?
    #   @pg_search_documents = PgSearch.multisearch(params[:query])
    #   respond_with(@pg_search_documents)
    # else
    #   @pg_search_documents = []
    #   flash[:notice] = "Looks like your search returned no results!"
    # end

    if params[:query].nil?
      flash[:notice] = "Looks like your search returned no results!"
    else
      @pg_search_documents = PgSearch.multisearch(params[:query])
      respond_with(@pg_search_documents)
    end
  end
end