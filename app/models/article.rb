class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :products
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  validates :name, presence: true, length { minimum: 5 }
end
