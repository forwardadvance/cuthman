class CreateAdminImages < ActiveRecord::Migration
  def change
    create_table :admin_images do |t|
      t.string :title
      t.attachment :image
      t.attachment :banner

      t.timestamps
    end
  end
end
