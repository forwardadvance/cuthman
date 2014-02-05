class Widget < ActiveRecord::Base

  belongs_to :page

  def resource
    resource_type.constantize.find(resource_id)
  end

  def resource=(resource)
    self.resource_type = resource.class.to_s
    self.resource_id = resource.id
  end

end
