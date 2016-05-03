class Reference < ActiveRecord::Base
  belongs_to :user, required: true
  has_and_belongs_to_many :categories
  acts_as_taggable

  scope :most_recent, -> { order(created_at: :desc) }
  scope :by_name, -> { order(name: :asc) }

  validates :name, presence: true, length: { minimum: 5 }
  validates :uri, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { minimum: 5, maximum: 125 }

  include ValidateTag

  include PgSearch
  multisearchable against: :name
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
