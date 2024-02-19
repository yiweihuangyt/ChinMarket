class DashboardsController < ApplicationController

  include Pagy::Backend

  def show
    if current_user.id == 6
      @pagy, @products = pagy(Product.order(created_at: :desc).all)
      @products = @products.select do | product |
        product.flagged == true
      end
    end
  end
end
