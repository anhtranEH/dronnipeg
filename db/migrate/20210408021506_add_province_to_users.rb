class AddProvinceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :province, foreign_key: true
  end
end
