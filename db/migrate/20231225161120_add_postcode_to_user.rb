class AddPostcodeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :postcode, :string
  end
end
