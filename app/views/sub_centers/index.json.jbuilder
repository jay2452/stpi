json.array!(@sub_centers) do |sub_center|
  json.extract! sub_center, :id, :content
  json.url sub_center_url(sub_center, format: :json)
end
