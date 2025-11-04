module ApplicationHelper
  # Mapea el nombre de una marca a su imagen SVG
  # Disponible en todas las vistas
  def brand_image_path(brand_name)
    # Mapeo de nombres de marca a archivos de imagen
    image_map = {
      "Adidas" => "adidas.svg",
      "Nike" => "nike.svg",
      "New Balance" => "newbalance.svg",
      "Samsung" => "samsung.svg",
      "Xiaomi" => "xiaomi.svg"
    }
    
    image_map[brand_name] || "basket.png" # Imagen por defecto si no hay mapeo
  end
end
