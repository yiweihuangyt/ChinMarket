class BidsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.build(bid_params)
    if @bid.price # Zorgt ervoor dat het niet vastloop wanneer er niks wordt ingevoerd
    if @product.bids.count == 0 or @product.bids.maximum(:price) < @bid.price # Check of het ingevoerde bod hoger is dan het huidige bod en of er een huidig bod is
    @bid.user = current_user
    if @bid.save
        redirect_to @product
    end

  end
  end
end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end
end
