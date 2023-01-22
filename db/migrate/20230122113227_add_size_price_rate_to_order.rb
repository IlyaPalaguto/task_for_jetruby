class AddSizePriceRateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :size, :integer
    add_column :orders, :price, :integer
    add_column :orders, :rate, :string
  end
end
