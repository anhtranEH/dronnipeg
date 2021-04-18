class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :province

  validates :email, uniqueness: true
  validates :first_name, :last_name, length: { in: 6..20 }
  validates :postal_code, length: { in: 6..7 }
  validates :address, length: { maximum: 500 }
  validates :city, length: { maximum: 100 }
  validates :province, presence: true
end
