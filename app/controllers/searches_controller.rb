class SearchesController < ApplicationController
  skip_authorization_check
  
  respond_to :html, :json, :js

  def index
    @product_results = PgSearch.multisearch(params[:query]).where(searchable_type: 'Product').map(&:searchable)
    @product_results = Kaminari.paginate_array(@product_results).page(params[:product]).per(4)

    @article_results = PgSearch.multisearch(params[:query]).where(searchable_type: 'Article').map(&:searchable)
    @article_results = Kaminari.paginate_array(@article_results).page(params[:article]).per(4)

    @reference_results = PgSearch.multisearch(params[:query]).where(searchable_type: 'Reference').map(&:searchable)
    @reference_results = Kaminari.paginate_array(@reference_results).page(params[:resource]).per(4)

    @tag_results = PgSearch.multisearch(params[:query]).where(searchable_type: 'Tag').map(&:searchable)
    @tag_results = Kaminari.paginate_array(@tag_results).page(params[:tag]).per(4)

    @pg_search_documents = @product_results + @article_results + @reference_results + @tag_results

    if @pg_search_documents.empty? 
      flash.now[:notice] = "Your search returned no results!"  
    else
      respond_with(@pg_search_documents)
    end
  end
end