class Category < ApplicationRecord
  # Relación con productos
  has_many :products, dependent: :destroy
  
  # Validaciones
  validates :name, presence: true, uniqueness: true
end
