class Api::V1::ApplicationApiController < ApplicationController
  protect_from_forgery with: :null_session#:exception
  private
  rescue_from CanCan::AccessDenied do |exception|
    render json: {message: t('rules.dont_permission')}, status: :unauthorized
  end
  def current_ability
   @current_ability ||= Ability.new(@current_user)  	
  end
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @key = Rails.application.secrets.secret_key_base
  end
  def authenticate
    if !request.headers["token"].nil? 
      token_frontend = request.headers["token"]
      decode = JWT.decode(token_frontend, @key)[0] 
      json_decode = HashWithIndifferentAccess.new decode
      token = Token.find_by(token:json_decode[:token])
      if token.nil? or not token.is_valid?
        render json: {message: "Tu token es invalido"},status: :unauthorized
      else
        @current_user = token.user
      end  
    else
      render json: {message: "No se obtuvieron parametros esperados"},status: :unauthorized
    end
  end
  rescue_from JWT::VerificationError do |exception|
    render json: {:message => t('jwt.decode_error')}, status: :unprocessable_entity    
  end
end