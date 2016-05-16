class AddTopBottomTextColumnToFleaMarket < ActiveRecord::Migration[5.0]
  def change
    add_column :flea_markets, :top_text, :text
    add_column :flea_markets, :bottom_text, :text
    add_column :flea_markets, :priority, :integer, default: 1
  end
end
