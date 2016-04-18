class AddViewCountColumnToFleaMarket < ActiveRecord::Migration
  def change
    add_column :flea_markets, :view_count, :integer, default: 0
  end
end
