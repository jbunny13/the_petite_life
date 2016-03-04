class SearchesController < ApplicationController
  respond_to :html, :json

  def index
    if params[:query]
      @pg_search_documents = PgSearch.multisearch(params[:query])
      respond_with(@pg_search_documents)
    else
      @pg_search_documents = []
    end
  end
end