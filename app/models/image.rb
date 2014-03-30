class Image < ActiveRecord::Base
  validates_presence_of :title

  include HasImage

end
