class Page < ActiveRecord::Base

  include HasMetadata
  include HasHierarchy

  has_many :widgets

  validates_presence_of :template
  validates_presence_of :slug

end
