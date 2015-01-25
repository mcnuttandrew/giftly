class CreateRequestChecklists < ActiveRecord::Migration
  def change
    create_table :request_checklists do |t|
    	t.integer :gift_request_id, null: false
      t.timestamps
    end
    add_index :request_checklists, :gift_request_id
  end
end
