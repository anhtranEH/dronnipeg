class OrderStatus < ApplicationRecord
  validates :name, presence: true
  def self.get_status(status)
    return OrderStatus.find_by(name: status.capitalize)
  end
end
