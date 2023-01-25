class RemoveDestinationDeparturePointFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :destination, :string
    remove_column :orders, :departure_point, :string
    remove_column :orders, :distance, :integer
  end
end
