class RemovePostcodeFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :postcode, :string
  end
end
