class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  def set_current_user
    @current_user = EndUser.find_by(id: session[:user_id])
  end

  protected

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_top_path
      when EndUser
        end_users_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana,
                                                                :last_name_kana, :zip_code, :address, :telephone_number, :is_unsubscribed ])
  end
end
