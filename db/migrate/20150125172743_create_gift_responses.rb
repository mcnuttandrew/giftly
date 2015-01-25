class CreateGiftResponses < ActiveRecord::Migration
  def change
    create_table :gift_responses do |t|
    	t.integer :gift_request_id, null: false
    	t.integer :user_id, null: false
    	t.text :response_body, null: false
    	t.boolean :is_selected, null: false, default: false
    	t.boolean :is_removed, null: false, default: false
      t.timestamps
    end
    add_index :gift_responses, :gift_request_id
  	add_index :gift_responses, :user_id
  	add_index :gift_responses, [:gift_request_id, :is_removed]
  	add_index :gift_responses, :is_selected
  end
end
