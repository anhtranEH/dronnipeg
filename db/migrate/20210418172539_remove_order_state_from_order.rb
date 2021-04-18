class RemoveOrderStateFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :order_state
  end
end
