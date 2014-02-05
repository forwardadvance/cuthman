class CreateMetadata < ActiveRecord::Migration
  def change
    create_table :metadata do |t|
      t.integer :page_id
      t.string :title
      t.text :description
      t.text :keywords
      t.string :og_title
      t.text :og_description
      t.integer :primary_widget_id

      t.timestamps
    end
  end
end
