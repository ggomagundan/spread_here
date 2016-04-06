class CreateFleamarketTags < ActiveRecord::Migration
  def change
    create_table :fleamarket_tags do |t|
      t.integer :is_visible, default: 1
      t.references :flea_market
      t.string :tag_name

      t.timestamps
    end
  end
end
