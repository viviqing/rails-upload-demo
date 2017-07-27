json.extract! upload_picture, :id, :created_at, :updated_at
json.url upload_picture_url(upload_picture, format: :json)
