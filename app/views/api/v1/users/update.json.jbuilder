json.user @user, partial: "api/v1/users/user", as: :user
json.message t('user.updated', email: @user.email)