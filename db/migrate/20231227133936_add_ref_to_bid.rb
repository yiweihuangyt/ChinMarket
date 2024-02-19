class AddRefToBid < ActiveRecord::Migration[7.0]
  def change
    add_reference :bids, :user, null: false, foreign_key: true
    add_reference :bids, :product, null: false, foreign_key: true
  end
end
