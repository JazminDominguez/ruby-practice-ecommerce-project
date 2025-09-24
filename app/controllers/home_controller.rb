class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to customer_dashboard_path
      end
    else
      # Mostrar página de bienvenida para usuarios no autenticados
    end
  end
end