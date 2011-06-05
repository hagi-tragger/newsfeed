class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    create_table :posts_tags, :id => false do |t|
      t.integer :post_id, :null => false
      t.integer :tag_id, :null => false
    end
    
    add_index :posts_tags, [:post_id, :tag_id], :unique => true
  end

  def self.down
    drop_table :posts_tags
    drop_table :tags
  end
end
