json.array!(@locations) do |location|
  json.extract! location, :id, :location_name, :location_area, :location_address
  json.url location_url(location, format: :json)
end
