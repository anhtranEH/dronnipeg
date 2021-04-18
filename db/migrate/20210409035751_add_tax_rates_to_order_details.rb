class AddTaxRatesToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :tax_rate, :decimal
  end
end
