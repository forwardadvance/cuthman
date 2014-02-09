class Map < ActiveRecord::Base

  acts_as_widget

  validates_presence_of :lat, :lng, :zoom

  after_create :wid

  def wid
    # self.place_widget_on Page.find_by_slug('news'), :list, :start
  end

end
