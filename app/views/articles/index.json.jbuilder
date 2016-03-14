json.array!(@articles) do |article|
  json.extract! article, :id, :name, :created_at, :updated_at, :content, :image, :tag_list, :categories
  json.url article_url(article, format: :json)
end
