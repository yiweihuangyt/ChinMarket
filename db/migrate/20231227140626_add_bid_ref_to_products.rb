class AddBidRefToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :bids, foreign_key: true
  end
end
