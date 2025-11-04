class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :stock, default: 0, null: false
      t.string :category
      t.string :brand

      t.timestamps
    end
  end
end
