class Category < ApplicationRecord
  has_many :products
  validates :name, :description, presence: true
  validates :name, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
end
