class CreateFleaMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :flea_markets do |t|

      t.integer :is_visible, default: 0
      t.string :market_name
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.string :memo
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
