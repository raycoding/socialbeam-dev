class CreateScribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.string :post
      t.string :posted_by
      t.integer :posted_by_uid

      t.timestamps
    end
  end
end
