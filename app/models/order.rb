class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :order_status, required: true
  delegate :name, prefix: 'status', to: :order_status
  validates :user_id, presence: true
  validates :total_tax, numericality: true
  validates :grand_total, numericality: true
  validates :order_status, presence: true
  validates :payment_id, uniqueness: true
end
