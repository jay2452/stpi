json.array!(@careers) do |career|
  json.extract! career, :id, :content
  json.url career_url(career, format: :json)
end
