class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :weight, null: false
      t.integer :length, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.string :departure_point, null: false
      t.string :destination, null: false

      t.timestamps
    end
  end
end
