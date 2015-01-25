class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :title, null: false
    	t.integer :gift_response_id, null: false
    	t.string :product_url
    	t.string :picture_url
    	t.text :serialized_json_info
      t.timestamps
    end
    add_index :products, :gift_response_id
    add_index :products, :title
  end
end
