json.extract! user, :id, :email, :created_at, :updated_at
json.profile user.profile, partial: "api/v1/profiles/profile", as: :profile