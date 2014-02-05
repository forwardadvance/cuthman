class MakeDefaultPages < ActiveRecord::Migration
  def up
    home = Page.create slug: "home", template: "homepage"
    news = Page.create slug: "news", parent_id: home.id, template: "article"
    about = Page.create slug: "about", parent_id: home.id, template: "article"
    podcast = Page.create slug: "podcast", parent_id: home.id, template: "article"
  end

  def down

  end
end
