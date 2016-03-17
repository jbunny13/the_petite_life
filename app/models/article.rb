class Article < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :comments, dependent: :destroy
  has_many :products
  has_and_belongs_to_many :categories
  acts_as_taggable

  validates :name, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 5 }

  has_attached_file :image,
    styles: { medium: "400x500#", thumb: "250x200>" },
    default_url: "missing.png"
  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    file_name: { matches: [/png\Z/, /jpe?g\Z/] },
    size: { less_than: 1.megabytes }

  include PgSearch
  multisearchable against: [:name, :content]
end
