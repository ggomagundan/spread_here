class AddComplteteColumnToParsing < ActiveRecord::Migration[5.0]
  def change
    add_column :parsings, :is_complete, :integer, default: 0
  end
end
