class Widget < ActiveRecord::Base

  belongs_to :page

  class << self
    def register_widget type
      unless self.widget_types.include? type
       self.widget_types << type
      end
    end

    def widget_types
       @widget_types ||= []
    end
  end

  validates_presence_of :page, message: "Sorry, we couldn't find the page. Please try again."
  validates_presence_of :resource_type, :resource_id, message: "Please select a piece of content"

  def resource
    resource_type.constantize.find(resource_id)
  end

  def resource=(resource)
    self.resource_type = resource.class.to_s
    self.resource_id = resource.id
  end


end
