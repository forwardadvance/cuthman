json.array!(@news) do |news|
  json.extract! news, :id, :title, :intro, :content
  json.url news_url(news, format: :json)
end
