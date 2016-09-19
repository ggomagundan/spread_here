class CreateParseConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :parse_configs do |t|
      t.integer :content_type
      t.text :cookie

      t.timestamps
    end
  end
end
