class CreateParsings < ActiveRecord::Migration[5.0]
  def change
    create_table :parsings do |t|
      t.integer :content_type
      t.text :content_id
      t.text :tags
      t.string :image_url
      t.text :content
      t.string :link
      t.string :user_name

      t.timestamps
    end
  end
end
