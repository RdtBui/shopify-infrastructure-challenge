class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :summary
      t.string :sku
      t.float :price
      t.integer :quantity
      t.string :category

      t.timestamps
    end
  end
end
