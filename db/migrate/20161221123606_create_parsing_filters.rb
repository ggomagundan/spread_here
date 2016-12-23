class CreateParsingFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :parsing_filters do |t|
      t.integer :is_work
      t.string :keyword
      t.integer :keyword_type

      t.timestamps
    end
  end
end
