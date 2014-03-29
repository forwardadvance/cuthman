class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug, index: true
      t.integer :parent_id
      t.string :template

      t.timestamps
    end
  end
end
