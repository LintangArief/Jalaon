json.array!(@request_categories) do |request_category|
  json.extract! request_category, :id, :service_category_id
  json.url request_category_url(request_category, format: :json)
end
