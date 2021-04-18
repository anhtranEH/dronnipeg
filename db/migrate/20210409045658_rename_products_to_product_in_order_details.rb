class RenameProductsToProductInOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :products_id, :product_id
  end
end
