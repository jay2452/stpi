json.array!(@tenders) do |tender|
  json.extract! tender, :id, :content
  json.url tender_url(tender, format: :json)
end
