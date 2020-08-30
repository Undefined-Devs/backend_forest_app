class Api::V1::ApplicationApiController < ApplicationController
  # app/controller/application_controller.rb
  before_action :ensure_json_request
  before_action :set_locale
  protect_from_forgery with: :null_session #:exception

  private

  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: t("rules.dont_permission") }, status: :unauthorized
  end

  def current_ability
    @current_ability ||= Ability.new(@current_user)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @key = Rails.application.secrets.secret_key_base
  end

  def authenticate
    authorization = request.headers["Authorization"]
    if authorization.present?
      authorization = authorization.sub("Bearer ", "")
      decode = JWT.decode(authorization, @key)[0]
      json_decode = HashWithIndifferentAccess.new decode
      token = Token.find_by(token: json_decode[:token])
      if token.nil? && !token.is_valid?
        render json: { message: "Tu token es invalido" }, status: :unauthorized
      else
        @current_user = token.user
      end
    else
      render json: { message: "No se obtuvieron parametros esperados" }, status: :unauthorized
    end
  end

  def ensure_json_request
    return if request.format == :json
    render :nothing => true, :status => 406
  end

  rescue_from JWT::VerificationError do |exception|
    render json: { :message => t("jwt.decode_error") }, status: :unprocessable_entity
  end
end
