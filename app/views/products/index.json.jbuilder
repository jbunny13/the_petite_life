json.array!(@products) do |product|
  json.extract! product, :id, :name, :created_at, :updated_at, :description, :image, :tag_list, :categories
  json.url product_url(product, format: :json)
end
