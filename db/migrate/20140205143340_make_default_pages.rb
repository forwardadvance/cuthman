class MakeDefaultPages < ActiveRecord::Migration
  def up
    home = Page.create slug: "home", template: "homepage"
  end

  def down

  end
end
