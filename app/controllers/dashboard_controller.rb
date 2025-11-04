class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_customer!

  def customer
    # Cargar todas las marcas y categorías para los filtros
    @brands = Brand.all.order(:name)
    @categories = Category.all.order(:name)
    
    # Cargar productos con filtros opcionales
    @products = Product.includes(:category, :brand).order(created_at: :desc)
    
    # Aplicar filtro por categoría si se seleccionó
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
    
    # Aplicar filtro por marcas si se seleccionaron
    if params[:brand_ids].present?
      brand_ids = params[:brand_ids].reject(&:blank?)
      @products = @products.where(brand_id: brand_ids) if brand_ids.any?
    end
    
    # Mantener los filtros seleccionados en la vista
    @selected_brands = params[:brand_ids] || []
    @selected_category = params[:category_id]
  end

  private

  def ensure_customer!
    redirect_to admin_dashboard_path unless current_user.customer?
  end
end