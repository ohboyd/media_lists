json.extract! movie, :id, :title, :suggested_by, :rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)
