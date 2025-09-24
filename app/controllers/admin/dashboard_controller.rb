# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def admin
    # Lógica para el dashboard del admin
  end

  private

  def ensure_admin!
    redirect_to customer_dashboard_path unless current_user.admin?
  end
end