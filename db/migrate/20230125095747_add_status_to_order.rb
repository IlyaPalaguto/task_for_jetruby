class AddStatusToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :integer, default: 0, null: false
  end
end
