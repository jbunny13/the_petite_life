class Product < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :categories
  acts_as_taggable

  scope :most_recent, -> { order(created_at: :desc) }
  scope :by_name, -> { order(name: :asc) }
  scope :average_rating, -> { includes(:reviews).sort_by(&:average_rating).reverse }

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }

  include ValidateTag
  
  has_attached_file :image, styles: { medium: "400x500>", thumb: "250x200>" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  include PgSearch
  multisearchable against: [:name, :description]

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def average_rating
    self.reviews.blank? ? 0 : self.reviews.average(:rating).round(2)
  end
end