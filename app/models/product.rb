class Product < ApplicationRecord
  # Relación con ActiveStorage para las imágenes
  has_many_attached :images

  # Relación con order_items (aunque aún no existe el modelo OrderItem, lo preparamos)
  has_many :order_items, dependent: :destroy

  # Relaciones con Category y Brand
  belongs_to :category
  belongs_to :brand

  # Validaciones
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 1000 }

  # Scopes útiles para consultas comunes
  # preguntar por como funciona el scope
  scope :in_stock, -> { where("stock > ?", 0) }
  # Actualizados para usar category_id y brand_id
  scope :by_category, ->(category_id) { where(category_id: category_id) if category_id.present? }
  scope :by_brand, ->(brand_id) { where(brand_id: brand_id) if brand_id.present? }
end
