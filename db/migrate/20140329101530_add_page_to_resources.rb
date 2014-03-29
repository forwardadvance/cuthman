class AddPageToResources < ActiveRecord::Migration
  def up
    [:articles, :news].each do |resource|
      change_table resource do |t|
        t.integer :page_id
      end
    end
  end

end
