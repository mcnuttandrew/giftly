class CreateTagTypes < ActiveRecord::Migration
  def change
    create_table :tag_types do |t|
    	t.string :tag_type_name, null: false, unique: true
      t.timestamps
    end
    add_index :tag_types, :tag_type_name
  end
end
