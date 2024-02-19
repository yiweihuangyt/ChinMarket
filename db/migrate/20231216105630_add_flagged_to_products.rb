class AddFlaggedToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :flagged, :boolean, default: false
  end
end
