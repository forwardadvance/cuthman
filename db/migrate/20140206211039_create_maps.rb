class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.float :lat
      t.float :lng
      t.integer :zoom
      t.string :type
      t.text :address
      t.string :tel

      t.timestamps
    end
  end
end
