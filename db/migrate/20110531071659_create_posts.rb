class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id, :null => false
      t.string :category, :limit => 30
      t.text :content
      t.string :theme
      t.string :source
      t.integer :rating, :default => 0
      t.timestamps
    end

    add_index :posts, :user_id
  end

  def self.down
    drop_table :posts
  end
end
