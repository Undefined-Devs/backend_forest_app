json.user @user, partial: "api/v1/users/user", as: :user
json.profile @user.profile, partial: "api/v1/profiles/profile", as: :profile
json.token @token, partial: "api/v1/tokens/token", as: :token
json.message t('sessions.login', email: "#{@user.profile.name} #{@user.profile.last_name}")