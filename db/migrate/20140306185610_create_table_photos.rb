class CreateTablePhotos < ActiveRecord::Migration
  def up
  	create_table :photos, :force => true do |t|
      t.string   :caption, :limit => 500
      t.integer  :profile_id
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
    add_index :photos, [:profile_id]
  end

  def down
  	drop_table :photos
  end
end
