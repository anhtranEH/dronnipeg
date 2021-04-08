class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.numeric :order_state
      t.decimal :total_tax
      t.decimal :grand_total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
