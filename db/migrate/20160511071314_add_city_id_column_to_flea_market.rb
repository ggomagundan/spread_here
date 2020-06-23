class AddCityIdColumnToFleaMarket < ActiveRecord::Migration[6.0]
  def change
    add_column :flea_markets, :city_id, :integer, index: true
  end
end
