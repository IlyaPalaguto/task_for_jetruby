class AddDistanceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :distance, :integer
  end
end
