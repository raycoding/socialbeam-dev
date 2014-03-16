class CreateTableProfiles < ActiveRecord::Migration
  def up
  	create_table :profiles, :force => true do |t|
      t.integer  :user_id
      t.string   :first_name
      t.string   :last_name
      t.string   :website
      t.string   :blog
      t.string 	 :twitter
      t.string   :facebook
      t.text     :about_me
      t.string   :gtalk_name
      t.string   :location
      t.string   :email, :unique=>true
      t.string   :alternate_email, :unique=>:true
      t.boolean  :is_active,  :default => false
      t.string   :youtube_username
      t.string   :time_zone, :default => "UTC"
      t.datetime :last_activity_at
      t.string   :icon_file_name
      t.string   :icon_content_type
      t.integer  :icon_file_size
      t.datetime :icon_updated_at
      t.timestamps
    end
    add_index :profiles, [:user_id]
  end

  def down
  	drop_table :profile
  end
end
