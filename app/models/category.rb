class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, :description, presence: true
  validates :name, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }

  def self.category_name_with_id
    all.map { |c| [c.name, c.id] }
  end

  def self.test
    CategoryServices.query_category_name_with_id
  end
end
