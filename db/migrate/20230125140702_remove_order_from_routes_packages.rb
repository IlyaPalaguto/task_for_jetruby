class RemoveOrderFromRoutesPackages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :routes, :order, null: false, foreign_key: true
    remove_reference :packages, :order, null: false, foreign_key: true
  end
end
