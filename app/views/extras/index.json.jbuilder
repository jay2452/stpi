json.array!(@extras) do |extra|
  json.extract! extra, :id, :content
  json.url extra_url(extra, format: :json)
end
