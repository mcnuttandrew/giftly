class CreateGiftRequests < ActiveRecord::Migration
  def change
    create_table :gift_requests do |t|
    	t.integer :user_id, null: false
    	t.string :title, null: false
    	t.text :description, null: false
    	t.boolean :is_closed, default: false
      t.timestamps
    end
    add_index :gift_requests, :title
    add_index :gift_requests, :user_id
    add_index :gift_requests, [:title, :is_closed]
  end
end
