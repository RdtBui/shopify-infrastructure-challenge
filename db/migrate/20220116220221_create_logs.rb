class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :item_title
      t.string :item_sku
      t.float :item_price
      t.integer :item_quantity
      t.string :item_brand
      t.string :string
      t.string :item_category

      t.timestamps
    end
  end
end
