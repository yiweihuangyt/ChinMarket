class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  include Pagy::Backend

  def show
    @pagy, @products = pagy(@user.products)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
