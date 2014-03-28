class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.string :title
      t.attachment :image
      t.attachment :banner

      t.timestamps
    end
  end
  def down
    drop_table :images
  end
end
