class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :products
  has_and_belongs_to_many :references

  validates :name, presence: true, length: { minimum: 3 }
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
