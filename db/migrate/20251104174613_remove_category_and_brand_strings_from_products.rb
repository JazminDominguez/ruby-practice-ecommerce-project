class RemoveCategoryAndBrandStringsFromProducts < ActiveRecord::Migration[8.0]
  def up
    # Si hay productos sin categoría o marca, asignamos valores por defecto
    # Primero verificamos si existen categorías y marcas
    default_category = Category.first
    default_brand = Brand.first
    
    if default_category && default_brand
      # Asignamos categoría y marca por defecto a productos que no las tengan
      Product.where(category_id: nil).update_all(category_id: default_category.id)
      Product.where(brand_id: nil).update_all(brand_id: default_brand.id)
    end
    
    # Eliminamos los campos string antiguos
    remove_column :products, :category, :string if column_exists?(:products, :category)
    remove_column :products, :brand, :string if column_exists?(:products, :brand)
    
    # Solo hacemos requeridos los campos si no hay productos sin ellos
    if Product.where(category_id: nil).count == 0
      change_column_null :products, :category_id, false
    end
    
    if Product.where(brand_id: nil).count == 0
      change_column_null :products, :brand_id, false
    end
  end
  
  def down
    # Si necesitamos revertir, agregamos las columnas de vuelta
    add_column :products, :category, :string unless column_exists?(:products, :category)
    add_column :products, :brand, :string unless column_exists?(:products, :brand)
    
    # Permitimos null temporalmente
    change_column_null :products, :category_id, true
    change_column_null :products, :brand_id, true
  end
end
