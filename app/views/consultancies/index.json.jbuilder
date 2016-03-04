json.array!(@consultancies) do |consultancy|
  json.extract! consultancy, :id, :content
  json.url consultancy_url(consultancy, format: :json)
end
