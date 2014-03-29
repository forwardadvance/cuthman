class News < ActiveRecord::Base

  validates_presence_of :title, :intro, :content

  acts_as_widget

  extend HasImage
  extend Widgetable
  extend HasPage

end
