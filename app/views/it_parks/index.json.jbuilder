json.array!(@it_parks) do |it_park|
  json.extract! it_park, :id, :content
  json.url it_park_url(it_park, format: :json)
end
