class CreateTableBlogs < ActiveRecord::Migration
  def up
  	create_table :blogs, :force => true do |t|
      t.string   :title
      t.text     :body
      t.integer  :profile_id
      t.timestamps
    end
    add_index :blogs, :profile_id
  end

  def down
  	drop_table :blogs
  end
end
