json.user do 
  json.extract! @user, :id,:email#, :permission_level
end
json.token do 
  json.extract! @token, :token, :expires_at
end
json.message t('sessions.login', email: @user.email)