class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug
      t.integer :parent_id
      t.integer :template_id
      t.integer :metadata_id

      t.timestamps
    end
  end
end
