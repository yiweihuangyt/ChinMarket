class AddPriceTypeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :price_type, :string
  end
end
