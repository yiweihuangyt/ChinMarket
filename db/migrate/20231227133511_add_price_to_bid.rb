class AddPriceToBid < ActiveRecord::Migration[7.0]
  def change
    add_column :bids, :price, :integer
  end
end
