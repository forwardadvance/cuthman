json.array!(@maps) do |map|
  json.extract! map, :id, :lat, :lng, :zoom, :type
  json.url map_url(map, format: :json)
end
