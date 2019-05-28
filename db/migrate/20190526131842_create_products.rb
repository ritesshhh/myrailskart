class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.date :expire_date
      t.text :images
      t.integer :sku_id, limit: 12

      t.timestamps
    end
  end
end
