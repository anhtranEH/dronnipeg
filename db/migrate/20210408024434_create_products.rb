class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.decimal :battery_life
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
