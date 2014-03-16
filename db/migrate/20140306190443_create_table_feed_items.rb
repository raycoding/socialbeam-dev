class CreateTableFeedItems < ActiveRecord::Migration
  def up
  	create_table :feed_items, :force => true do |t|
      t.boolean  :include_comments, :default => false, :null => false
      t.boolean  :is_public, :default => false, :null => false
      t.integer  :item_id
      t.string   :item_type
      t.timestamps
    end
    add_index :feed_items, [:item_id, :item_type]
  end

  def down
  	drop_table :feed_items
  end
end
