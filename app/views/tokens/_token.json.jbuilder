json.extract! token, :id, :expires_at, :token, :user_id, :created_at, :updated_at
json.url token_url(token, format: :json)
