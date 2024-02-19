class AddGereserveerdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :gereserveerd, :boolean, default: false
  end
end
