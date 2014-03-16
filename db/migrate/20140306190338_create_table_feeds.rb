class CreateTableFeeds < ActiveRecord::Migration
  def up
  	create_table :feeds, :force => true do |t|
      t.integer :profile_id
      t.integer :feed_item_id
      t.timestamps
    end
    add_index :feeds, [:profile_id, :feed_item_id]
  end

  def down
  	drop_table :feeds
  end
end
