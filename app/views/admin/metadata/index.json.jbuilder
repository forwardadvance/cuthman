json.array!(@metadata) do |metadatum|
  json.extract! metadatum, :id, :page_id, :title, :description, :keywords, :og_title, :og_description, :primary_widget_id
  json.url metadatum_url(metadatum, format: :json)
end
