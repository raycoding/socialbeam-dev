class AddUpsAndDownsToScribble < ActiveRecord::Migration
  def change
    add_column :scribbles, :ups, :integer
    add_column :scribbles, :downs, :integer
  end
end
