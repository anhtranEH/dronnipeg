class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.decimal :price
      t.numeric :quantity
      t.references :products, foreign_key: true
      t.references :orders, foreign_key: true

      t.timestamps
    end
  end
end
