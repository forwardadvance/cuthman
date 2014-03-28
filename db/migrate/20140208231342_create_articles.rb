class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :intro
      t.text :content
      t.attachment :image
      t.attachment :banner

      t.timestamps
    end
  end
end
