class Product < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :categories
  acts_as_taggable

  validates :name, presence: true, length: { minimum: 5 }
  
  has_attached_file :image, styles: { medium: "400x500#", thumb: "250x200>" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  include PgSearch
  multisearchable against: [:name, :category, :description]
end
