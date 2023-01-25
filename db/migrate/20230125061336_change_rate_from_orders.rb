class ChangeRateFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :rate, :string
    add_column :orders, :rate, :integer
  end
end
