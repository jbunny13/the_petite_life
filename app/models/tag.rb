class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :products
  has_and_belongs_to_many :references
end
