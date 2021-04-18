class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :order_status, required: true
  delegate :name, prefix: 'status', to: :order_status
end
