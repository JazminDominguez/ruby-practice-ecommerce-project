class AddCategoryAndBrandToProducts < ActiveRecord::Migration[8.0]
  def change
    # Primero agregamos las columnas como opcionales (null: true) para permitir migración de datos existentes
    add_reference :products, :category, null: true, foreign_key: true
    add_reference :products, :brand, null: true, foreign_key: true
  end
end
