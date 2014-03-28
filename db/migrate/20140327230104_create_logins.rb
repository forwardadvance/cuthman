class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.integer :user_id
      t.string :session_key, index: true
      t.datetime :expires

      t.timestamps
    end
  end
end
