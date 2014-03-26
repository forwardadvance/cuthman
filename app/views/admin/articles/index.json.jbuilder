json.array!(@articles) do |article|
  json.extract! article, :id, :title, :intro, :content
  json.url article_url(article, format: :json)
end
