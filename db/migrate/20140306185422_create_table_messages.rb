class CreateTableMessages < ActiveRecord::Migration
  def up
  	create_table :messages, :force => true do |t|
      t.string   :subject
      t.text     :body
      t.integer  :sender_id
      t.integer  :receiver_id
      t.boolean  :read, :default => false, :null => false
      t.timestamps
    end
    add_index :messages, [:sender_id]
    add_index :messages, [:receiver_id]
  end

  def down
  	drop_table :messages
  end
end
