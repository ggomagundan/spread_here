class AddCityIdColumnToFleaMarket < ActiveRecord::Migration
  def change
    add_column :flea_markets, :city_id, :integer, index: true
  end
end
