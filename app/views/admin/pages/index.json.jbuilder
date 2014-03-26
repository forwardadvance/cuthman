json.array!(@pages) do |page|
  json.extract! page, :id, :slug, :parent_id, :template_id, :metadata_id
  json.url page_url(page, format: :json)
end
