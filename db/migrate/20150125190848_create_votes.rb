class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :gift_response_id, null: false
    	t.integer :voter_id, null: false
      t.timestamps
    end
    add_index :votes, :gift_response_id
    add_index :votes, :voter_id
  end
end
