class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :body
      t.integer :price
      t.string :delivery

      t.timestamps
    end
  end
end
