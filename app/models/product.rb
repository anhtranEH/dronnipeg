class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :order_details
  has_many :order, through: :order_details

  validates :category, presence: true
  validates :price, :battery_life, numericality: true
  validates :description, :price, :battery_life, presence: true
end
