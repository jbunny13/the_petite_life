class SearchesController < ApplicationController
  respond_to :html, :json

  def index
    @pg_search_documents = PgSearch.multisearch(params[:query])

    if @pg_search_documents.empty? 
      flash.now[:notice] = "Your search returned no results!"  
    else
      respond_with(@pg_search_documents)
    end
  end
end