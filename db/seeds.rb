# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Crear categorías predefinidas
categories = [
  "Calzado",
  "Ropa y Accesorios",
  "Wearables y Electrónica Personal",
  "Smartphones y Tablets",
  "Audio",
  "Tecnología y Gadgets",
  "Deporte y Fitness"
]

categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
  puts "Categoría creada/verificada: #{category_name}"
end

# Crear marcas predefinidas
brands = [
  "Adidas",
  "Nike",
  "New Balance",
  "Samsung",
  "Xiaomi"
]

brands.each do |brand_name|
  Brand.find_or_create_by!(name: brand_name)
  puts "Marca creada/verificada: #{brand_name}"
end

puts "\n✅ Seeds ejecutados exitosamente!"
puts "   - #{Category.count} categorías disponibles"
puts "   - #{Brand.count} marcas disponibles"
