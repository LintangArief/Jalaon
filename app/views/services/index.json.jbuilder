json.array!(@services) do |service|
  json.extract! service, :id, :user_id, :service_category_id, :title, :description, :avatar
  json.url service_url(service, format: :json)
end
