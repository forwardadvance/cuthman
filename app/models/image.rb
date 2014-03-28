class Image < ActiveRecord::Base
  validates_presence_of :title

  extend HasImage
  extend Widgetable

end
