class AddBeamerIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :beamer_id, :string,:null => false,:unique => true
  end
end
