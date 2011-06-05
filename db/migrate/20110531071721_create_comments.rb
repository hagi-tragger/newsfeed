class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :post_id, :null => false
      t.integer :user_id			#комментировать могут все желающие
      t.text :body
      t.timestamps
    end

    add_index :comments, :post_id
  end

  def self.down
    drop_table :comments
  end
end
