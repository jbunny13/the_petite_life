class SearchController < ApplicationController
  skip_authorization_check
  
  respond_to :html, :json, :js

  def index
    searchable_results = PgSearch.multisearch(params[:query]).includes(:searchable)

    @tagged_products = Product.includes(:reviews).tagged_with(params[:query])
    products = @tagged_products + searchable_results.where(searchable_type: 'Product').map(&:searchable)
    @product_results = Kaminari.paginate_array(products).page(params[:product]).per(4)

    @tagged_articles = Article.includes(:comments).tagged_with(params[:query])
    articles = @tagged_articles + searchable_results.where(searchable_type: 'Article').map(&:searchable)
    @article_results = Kaminari.paginate_array(articles).page(params[:article]).per(4)

    @tagged_references = Reference.tagged_with(params[:query])
    references = @tagged_references + searchable_results.where(searchable_type: 'Reference').map(&:searchable)
    @reference_results = Kaminari.paginate_array(references).page(params[:resource]).per(4)

    tags = searchable_results.where(searchable_type: 'Tag').map(&:searchable)
    @tag_results = Kaminari.paginate_array(tags).page(params[:tag]).per(4)

    @pg_search_documents = @product_results + @article_results + @reference_results + @tag_results

    if @pg_search_documents.empty? 
      flash.now[:notice] = "Your search for #{params[:query]} returned no results!"  
    else
      respond_with(@pg_search_documents)
    end
  end
end