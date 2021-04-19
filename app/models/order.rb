class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, allow_destroy: true
  belongs_to :order_status, optional: false
  delegate :name, prefix: "status", to: :order_status
  validates :user_id, presence: true
  validates :total_tax, numericality: true
  validates :grand_total, numericality: true
  validates :order_status, presence: true
  validates :payment_id, length: { maximum: 200 }
end
