json.extract! post, :id, :title, :description, :movie_url, :photo_url
json.user post.user, partial: "api/v1/users/user", as: :user
json.challenges post.challenges, partial: "api/v1/challenges/challenge", as: :challenge
