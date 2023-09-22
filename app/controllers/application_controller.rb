class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, unless: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む記述に変更
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :profile, :image])
  end

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

end
