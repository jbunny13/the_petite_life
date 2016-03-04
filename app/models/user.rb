class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :zxcvbnable
  has_many :products
  has_many :reviews, dependent: :destroy
  ROLES = %w[user contributor moderator internal_admin]

  def full_name
    "#{first_name} #{last_name}"
  end
end
