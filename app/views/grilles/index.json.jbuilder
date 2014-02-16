json.array!(@grilles) do |grille|
  json.extract! grille, :id
  json.url grille_url(grille, format: :json)
end
