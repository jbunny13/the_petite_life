json.array!(@references) do |reference|
  json.extract! reference, :id, :name, :uri, :created_at, :updated_at, :tag_list, :categories
  json.url reference_url(reference, format: :json)
end
