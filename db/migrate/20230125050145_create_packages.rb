class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.integer :width, null: false
      t.integer :weight, null: false
      t.integer :length, null: false
      t.integer :height, null: false
      t.decimal :size, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
