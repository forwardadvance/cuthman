class Page < ActiveRecord::Base

  extend HasMetadata
  extend HasHierarchy

  has_many :widgets

  validates_presence_of :template
  validates_presence_of :slug

end
