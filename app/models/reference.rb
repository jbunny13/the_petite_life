class Reference < ActiveRecord::Base
  belongs_to :user, required: true
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { minimum: 5 }
  validates :uri, presence: true, length: { minimum: 10 }
end
