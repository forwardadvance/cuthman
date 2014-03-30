class Article < ActiveRecord::Base
  validates_presence_of :title, :intro, :content

  include HasImage
  include HasPage

end
