class OrderDetail < ApplicationRecord
  belongs_to :order, inverse_of: :order_details
  belongs_to :product

  validates :quantity, :product_id, :order_id, presence: true
  validates :price, :quantity, :tax_rate, numericality: true
end
