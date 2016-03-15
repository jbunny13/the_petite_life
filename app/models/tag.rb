class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  include PgSearch
  multisearchable against: :name
end