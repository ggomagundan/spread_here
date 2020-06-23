class CreateFleamarketImages < ActiveRecord::Migration[6.0]
  def change
    create_table :fleamarket_images do |t|
      t.integer :is_visible, default: 1
      t.references :flea_market
      t.string :image
      t.integer :image_type, default: 0
      t.integer :sort


      t.timestamps
    end
  end
end
