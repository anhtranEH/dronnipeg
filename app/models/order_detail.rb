class OrderDetail < ApplicationRecord
  belong_to :order
  belong_to :product
end
