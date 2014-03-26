# This file contains all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'yaml'
path = [Rails.root.to_s, 'db/seeds/seeds.yml'].join '/'
puts path
content = YAML.load_file(path)
content['pages'].each do |key, val|
  puts key
  val.merge!(slug:key.to_s)
  instance_variable_set("@#{key}_page", Page.create(val))
end
content['articles'].each do |key, val|
  puts key
  params = val.remove('widgets')
  @article = Article.create(params))
  instance_variable_set("@#{key}_article", @article
  widgets.each do |key, val|
    assign_widgets(
      Page.find_by_slug(key),
      val.slot,
      @article,
      val.sort
    )
  end
end

def assign_widgets(page, slot, resource, sort)
  Widget.create
end