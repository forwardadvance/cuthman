class Article < ActiveRecord::Base
  validates_presence_of :title, :intro, :content

  extend HasImage
  add_attachment

end
