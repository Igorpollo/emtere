json.extract! evento, :id, :inicio, :fim, :nome, :texto, :created_at, :updated_at
json.url evento_url(evento, format: :json)
