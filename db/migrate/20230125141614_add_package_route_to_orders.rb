class AddPackageRouteToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :package, null: false, foreign_key: true
    add_reference :orders, :route, null: false, foreign_key: true
  end
end
