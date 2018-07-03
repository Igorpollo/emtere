json.extract! artigo, :id, :titulo, :texto, :user_id, :created_at, :updated_at
json.url artigo_url(artigo, format: :json)
