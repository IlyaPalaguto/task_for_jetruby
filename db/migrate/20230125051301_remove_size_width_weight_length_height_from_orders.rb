class RemoveSizeWidthWeightLengthHeightFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :size, :integer
    remove_column :orders, :width, :integer
    remove_column :orders, :length, :integer
    remove_column :orders, :height, :integer
    remove_column :orders, :weight, :integer
  end
end
