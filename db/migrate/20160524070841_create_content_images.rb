class CreateContentImages < ActiveRecord::Migration[5.0]
  def change
    create_table :content_images do |t|

      t.string :image
      t.string :content_type
      t.integer :content_id

      t.timestamps
    end
  end
end
