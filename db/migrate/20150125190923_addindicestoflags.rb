class Addindicestoflags < ActiveRecord::Migration
  def change
  	add_index :flags, :flagger_id
  	add_index :flags, :flaggee_id
  	add_index :flags, [:flag_type, :flagger_id]
  	add_index :flags, [:flag_type, :flaggee_id]
  end
end
