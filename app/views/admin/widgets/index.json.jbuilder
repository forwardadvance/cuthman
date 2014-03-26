json.array!(@widgets) do |widget|
  json.extract! widget, :id, :page_id, :template_location, :resource_id, :resource_type
  json.url widget_url(widget, format: :json)
end
