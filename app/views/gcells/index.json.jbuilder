json.array!(@gcells) do |gcell|
  json.extract! gcell, :id, :content
  json.url gcell_url(gcell, format: :json)
end
