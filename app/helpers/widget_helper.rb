module WidgetHelper

  def widget widget, style, args={}
    @widget = widget
    @resource = widget.resource
    instance_variable_set("@#{@resource.class.to_s.underscore}", @resource)
    file = [widget.resource_type.underscore.pluralize, "widgets", style].join('/')
    output = []
    output << "<div class='widget #{style}_widget #{@resource.class.to_s.underscore}_widget'>"
    if admin?
      output << render(partial: 'layouts/admin/edit_widget_button')
      output << render(partial: 'layouts/admin/destroy_widget_button')
    end
    begin
      output << render(file: file)
    rescue => e
      output << "problem rendering #{file}: #{e.message}"
    end
    output << "</div>"
    return output.join.html_safe
  end
end
