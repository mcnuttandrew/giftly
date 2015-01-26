class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.integer :tag_type_id, null: false
    	t.integer :request_id, null: false
      t.timestamps
    end
    add_index :tags, :tag_type_id
    add_index :tags, :request_id
    add_index :tags, [:request_id, :tag_type_id], unique: true
  end
end
