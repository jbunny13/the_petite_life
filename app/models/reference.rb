class Reference < ActiveRecord::Base
  belongs_to :user, required: true
  has_and_belongs_to_many :categories
  acts_as_taggable

  validates :name, presence: true, length: { minimum: 5 }
  validates :uri, presence: true, length: { minimum: 10 }

  include ValidateTag

  include PgSearch
  multisearchable against: :name
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
