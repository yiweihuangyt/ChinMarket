class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_categories

  include Pagy::Backend

  def index
    @pagy, @products = pagy(Product.order(created_at: :desc).all)
  end

  def show
    @product = Product.find(params[:id])
    @other_products = Category.find(@product.category.id).products.limit(6)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.user == current_user
      if params[:product][:image].present?
        @product.image.attach(params[:product][:image])
      end

      if params[:product][:remove_images].present? && params[:product][:remove_images].any?
        if @product.image.count > params[:product][:remove_images].count
          params[:product][:remove_images].each do |image_id|
            @product.image.find(image_id).purge
          end
        else

        end
      end

      if @product.update(product_params.except(:image, :remove_images))
      redirect_to @product
      else
      render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user == current_user
      @product.destroy

      redirect_to root_path, status: :see_other
    end
  end

  def reserveer
    @product = Product.find(params[:id])
    if @product.user == current_user
    @product.update(gereserveerd: true)
    end
    redirect_to @product
  end

  def dereserveer
    @product = Product.find(params[:id])
    if @product.user == current_user
      @product.update(gereserveerd: false)
    end
    redirect_to @product
  end

  def flag
    @product = Product.find(params[:id])
      @product.update(flagged: true)
    redirect_to @product
  end

  private
    def product_params
        params.require(:product).permit(:title, :body, :price, :delivery, :category_id, :condition, :price_type, remove_images: [], image: [])
    end

    def set_categories
      @categories = Category.all
    end
end
