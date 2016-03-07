class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :content, presence: true, length: { minimum: 5 }
end
