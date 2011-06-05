class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :post_id, :null => false
      t.integer :user_id
      t.integer :value
      t.string :ip
      t.timestamps
    end

    add_index :votes, [:post_id, :user_id]
    add_index :votes, [:post_id, :ip]
  end

  def self.down
    drop_table :votes
  end
end
