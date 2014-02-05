module WidgetsHelper

  def widgets location, style
    @page.widgets.where(location: location).each do |widget|
      file = [widget.resource_type.camelize, "widgets", style].join('/')
      render file: file
    end
  end
end
