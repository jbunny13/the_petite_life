json.array!(@references) do |reference|
  json.extract! reference, :id, :name, :uri
  json.url reference_url(reference, format: :json)
end
