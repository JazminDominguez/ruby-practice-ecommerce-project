class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # Muestra todos los productos
  def index
    @products = Product.includes(:category, :brand).order(created_at: :desc)
  end

  # GET /admin/products/:id
  # Muestra un producto específico
  def show
  end

  # GET /admin/products/new
  # Muestra el formulario para crear un nuevo producto
  def new
    @product = Product.new
    @categories = Category.all.order(:name)
    @brands = Brand.all.order(:name)
  end

  # POST /admin/products
  # Crea un nuevo producto
  def create
    @product = Product.new(product_params)
    @categories = Category.all.order(:name)
    @brands = Brand.all.order(:name)
    
    if @product.save
      redirect_to admin_products_path, notice: 'Producto creado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /admin/products/:id/edit
  # Muestra el formulario para editar un producto
  def edit
    @categories = Category.all.order(:name)
    @brands = Brand.all.order(:name)
  end

  # PATCH/PUT /admin/products/:id
  # Actualiza un producto existente
  def update
    @categories = Category.all.order(:name)
    @brands = Brand.all.order(:name)
    
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Producto actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/products/:id
  # Elimina un producto
  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Producto eliminado exitosamente.'
  end

  private

  # Busca el producto por ID
  def set_product
    @product = Product.find(params[:id])
  end

  # Define los parámetros permitidos para crear/actualizar productos
  # strong parameters
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category_id, :brand_id, images: [])
  end

  # Verifica que el usuario sea admin
  def ensure_admin!
    redirect_to customer_dashboard_path unless current_user.admin?
  end
end

