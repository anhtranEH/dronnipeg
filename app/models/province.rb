class Province < ApplicationRecord
  validates :name, length: { in: 6..20 }
  validates :hst, :gst, :pst, numericality: true
end
