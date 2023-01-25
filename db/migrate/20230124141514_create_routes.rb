class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :destination, null: false
      t.string :departure_point, null: false
      t.integer :distance, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
