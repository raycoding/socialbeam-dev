class CreateTableComments < ActiveRecord::Migration
  def up
  	create_table :comments, :force => true do |t|
      t.text     :comment
      t.integer  :profile_id
      t.string   :commentable_type, :default => "", :null => false
      t.integer  :commentable_id, :null => false
      t.integer  :is_denied, :default => 0, :null => false
      t.boolean  :is_reviewed, :default => false
      t.timestamps
    end
    add_index :comments, [:profile_id]
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def down
  	drop_table :comments
  end
end
