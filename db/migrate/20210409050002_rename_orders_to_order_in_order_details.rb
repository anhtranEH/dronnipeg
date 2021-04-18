class RenameOrdersToOrderInOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :orders_id, :order_id
  end
end
