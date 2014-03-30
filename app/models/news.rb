class News < ActiveRecord::Base

  validates_presence_of :title, :intro, :content

  acts_as_widget

  include HasImage
  # extend Widgetable
  include HasPage

end
