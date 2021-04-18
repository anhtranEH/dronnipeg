class OrderStatus < ApplicationRecord
  def self.get_status(status)
    return OrderStatus.find_by(name: status.capitalize)
  end
end
