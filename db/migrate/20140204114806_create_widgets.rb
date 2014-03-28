class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :page_id, index: true
      t.string :slot, index: true
      t.integer :resource_id
      t.string :resource_type
      t.string :sort, index: true
      t.string :style

      t.timestamps
    end
  end
end
