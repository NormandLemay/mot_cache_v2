json.array!(@lexiques) do |lexique|
  json.extract! lexique, :id
  json.url lexique_url(lexique, format: :json)
end
