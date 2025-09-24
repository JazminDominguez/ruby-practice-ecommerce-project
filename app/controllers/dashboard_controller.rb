class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_customer!

  def customer
    # Lógica para el dashboard del customer
  end

  private

  def ensure_customer!
    redirect_to admin_dashboard_path unless current_user.customer?
  end
end