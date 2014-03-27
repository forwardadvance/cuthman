class News < ActiveRecord::Base

  acts_as_widget

  extend HasImage

end
