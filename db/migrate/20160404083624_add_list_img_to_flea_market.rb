class AddListImgToFleaMarket < ActiveRecord::Migration
  def change
    add_column :flea_markets, :list_image, :string
    add_column :flea_markets, :top_image, :string
  end
end
