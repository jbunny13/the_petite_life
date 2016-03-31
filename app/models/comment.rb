class Comment < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :article, required: true

  validates :content, presence: true, length: { minimum: 5 }
end
