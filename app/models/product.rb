class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :order, through: :order_details

  validates :category, presence: true
  validates :price, :battery_life, numericality: true
  validates :description, :price, :battery_life, :name, presence: true

  def self.search_product(keyword, category)
    if category != "All"
      Product.where("name LIKE '%#{keyword}%' OR description LIKE '%#{keyword}%'")
             .where(category_id: category)
    else
      Product.where("name LIKE '%#{keyword}%' OR description LIKE '%#{keyword}%'")
    end
  end
end
