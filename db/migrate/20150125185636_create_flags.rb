class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
    	t.integer :flagger_id, null: false
    	t.integer :flaggee_id, null: false
    	t.string :flag_type, null: false
    	t.integer :flaggable_id, null: false
      t.timestamps
    end
  end
end
