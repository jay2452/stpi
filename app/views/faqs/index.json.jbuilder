json.array!(@faqs) do |faq|
  json.extract! faq, :id, :content
  json.url faq_url(faq, format: :json)
end
