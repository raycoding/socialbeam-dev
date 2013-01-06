class CreateNewsfeeds < ActiveRecord::Migration
  def self.up

     # The Activity Stream table
      create_table :newsfeeds do |t|
      t.string  :verb                            # The verb
      t.string  :activity                        # The activity
      t.string :actor_id                        # Actor ID
      t.string  :actor_type                      
      t.string  :actor_name_method               # Method on the actor model
      t.string :indirect_actor_id              #Indirect Actor ID
      t.string  :indirect_actor_type            # Polymorphic indirect object
      t.string  :indirect_actor_name_method
      t.integer :count, :default => 1            # Count
      t.string :object_id                       # Polymorphic social object
      t.string  :object_type
      t.string  :object_name_method              # Method on the object name
      t.integer :privacystatus, :default =>0     # 0=public;1=followers&following;2=group;3=list
      t.timestamps
    end
    
  end

  def self.down
    drop_table    :newsfeeds
  end
end

