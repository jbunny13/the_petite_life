class StaticPagesController < ApplicationController
  skip_authorization_check
  
  def home
    @products = Product.all.sample(4)
  end

  def about
  end
end
