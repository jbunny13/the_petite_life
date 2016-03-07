class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :comments
  has_many :products
  has_and_belongs_to_many :tags
  belongs_to :user
end