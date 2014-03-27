module SlotHelper

  def slot slot_name, style, args={}
    limit = args[:limit] || 1
    output = []
    widgets = @page.widgets.where(slot: slot_name).order(:sort)
    output << "<div class='slot #{slot_name} #{style}' data-limit='#{limit}' data-count='#{widgets.count}'>"
    widgets.each do |widget|
      output << widget(widget, style)
    end
    output << render(partial: 'layouts/admin/widget_selection')
    if (limit >  widgets.count) && admin?
      output << render(partial: 'layouts/admin/add_widget_button', locals: {slot_name: slot_name} )
    end
    output << "</div>"
    return output.join.html_safe
  end
end
