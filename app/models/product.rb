class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3 }
  has_attached_file :image, styles: { medium: "400x500#", thumb: "250x200>" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
