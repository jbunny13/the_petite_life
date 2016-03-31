class Review < ActiveRecord::Base
  belongs_to :product, required: true
  belongs_to :user, required: true
  
  validates :rating, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
