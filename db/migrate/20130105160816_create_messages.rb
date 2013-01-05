class CreateMessages < ActiveRecord::Migration
	def up
		create_table :messages do |t|
			t.string :sender_id,:null => false
			t.string :recepient_id
			t.boolean :sender_deleted, :recepient_deleted, :default => 0
			t.string :subject,:null => false
			t.text :body
			t.datetime :read_at
			t.string :container,:default => "draft"
			t.timestamps
		end
	end

	def down
		drop_table :messages
	end
end