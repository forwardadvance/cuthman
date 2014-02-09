class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :page_id
      t.string :slot
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
  end
end