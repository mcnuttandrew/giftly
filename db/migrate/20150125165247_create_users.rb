class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, unique: true
    	t.text :profile_body
    	t.string :encrypted_password
    	t.string :session_token
    	t.string :picture_url
    	t.integer :reputation, default: 0
      t.timestamps
    end
    add_index :users, :session_token
    add_index :users, :username
    add_index :users, :reputation

  end
end
