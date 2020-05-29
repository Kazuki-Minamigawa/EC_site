class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_end_user

  def set_current_end_user
    @current_user = EndUser.find_by(id: session[:user_id])
  end

  protected

  def correct_user
    @correct_end_user = current_end_user
      unless @correct_end_user
        redirect_to root_path
      end
  end

  def after_sign_in_path_for(resource)
    case resource
      when EndUser
        end_users_path
      when Admin
        admin_top_path
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
