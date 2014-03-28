json.array!(@admin_images) do |admin_image|
  json.extract! admin_image, :id, :title
  json.url admin_image_url(admin_image, format: :json)
end
