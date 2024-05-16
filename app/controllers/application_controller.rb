class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_out_path_for(resource)
  flash[:notice] = "Signed out Successfully"
  root_path
 end

 def after_sign_in_path_for(resource)
   user_path(current_user.id)
 end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user == current_user
      flash[:notice] = "他のユーザーの編集画面にアクセスすることはできません。"
      redirect_to root_path
    end
  end
end
