class CreateTableUsers < ActiveRecord::Migration
  def up
  	create_table :users, :force => true do |t|
      t.string   :email,:null => false,:default =>""
      t.string   :login
      t.boolean  :is_admin
      t.boolean  :can_send_messages, :default => true
      t.timestamps
    end
    add_column :users, :crypted_password, :string, :null => false
    add_column :users, :password_salt, :string, :null => false
    add_column :users, :persistence_token, :string, :null => false
    add_column :users, :single_access_token,:string,:null => false
    add_column :users, :login_count,:integer,:null => false, :default => 0
    add_column :users, :failed_login_count,:integer,:null => false, :default => 0
    add_column :users, :last_request_at,:datetime
    add_column :users, :current_login_at,:datetime
    add_column :users, :last_login_at,:datetime
    add_column :users, :current_login_ip,:string
    add_column :users, :last_login_ip,:string

    add_index :users, [:login], :name => "index_users_on_login"
    add_index(:users, [:email], :name => "index_users_on_email",:unique=>true)
  end

  def down
  	drop_table :users
  end
end
