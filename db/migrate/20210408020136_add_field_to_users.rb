class AddFieldToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
  end
end
