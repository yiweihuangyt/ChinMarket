class CategoriesController < ApplicationController
  include Pagy::Backend
  def show
        @pagy, @category = pagy(Category.find(params[:id]).products)
        @current_category_name = Category.find(params[:id]).name
        @categories = Category.all
      end
end
