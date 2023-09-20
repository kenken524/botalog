class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # パスワードなしで更新できるメソッド
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # 編集後のリダイレクト先を指定するメソッド
  def after_update_path_for(resource)
    user_path(resource)
  end
end