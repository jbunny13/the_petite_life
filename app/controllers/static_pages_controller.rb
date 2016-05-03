class StaticPagesController < ApplicationController
  skip_authorization_check
  
  def home
    @products = Product.includes(:reviews).average_rating.first(4)
  end

  def about
  end
end
