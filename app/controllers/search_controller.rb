class SearchController < ApplicationController
  include Pagy::Backend

  def index
    if params[:search].present?
      results = Product.pagy_search(params[:search], fields: %i[title body] )
      @pagy, @products = pagy_searchkick(results)
    else
      @pagy, @products = pagy(Product.order(created_at: :desc).all)
    end

    if params[:postcode].present? && params[:zoekbereik].present?
      start_location = Geocoder.search(params[:postcode]).first.coordinates
      @products = @products.select do |product|
        product_location = Geocoder.search(product.user.postcode).first.coordinates
        distance = Geocoder::Calculations.distance_between(start_location, product_location, units: :km)
        product.distance = distance
        distance < params[:zoekbereik].to_i
      end
    end

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream do
        render turbo_stream:
          turbo_stream.update("products",
            partial: "products/products",
            locals: { products: @products })
      end
    end
  end
end
