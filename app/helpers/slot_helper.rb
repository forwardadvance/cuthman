module SlotHelper

  def slot slot_name, style, args={}
    limit = args[:limit] || 1
    output = []
    widgets = @page.widgets.where(slot: slot_name).order(:sort)
    output << "<div class='slot #{slot_name} #{style}' data-limit='#{limit}' data-count='#{widgets.count}'>"
    widgets.each do |widget|
      @widget = widget
      @resource = widget.resource
      instance_variable_set("@#{@resource.class.to_s.underscore}", @resource)
      file = [widget.resource_type.underscore.pluralize, "widgets", style].join('/')
      output << "<div class='widget #{style}_widget'>"
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
    end
    output << render(partial: 'layouts/admin/widget_selection')
    if (limit >  widgets.count) && admin?
      output << render(partial: 'layouts/admin/add_widget_button', locals: {slot_name: slot_name} )
    end
    output << "</div>"
    return output.join.html_safe
  end
end
