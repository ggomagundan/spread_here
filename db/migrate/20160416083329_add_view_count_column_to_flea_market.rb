class AddViewCountColumnToFleaMarket < ActiveRecord::Migration[6.0]
  def change
    add_column :flea_markets, :view_count, :integer, default: 0
  end
end
