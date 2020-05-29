class EndUsersController < ApplicationController
  before_action :correct_user
  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end

  def update
    @end_user = EndUser.find(current_end_user.id)
    if @end_user.update(end_user_params)
      flash[:notice] = "登録情報を変更しました。"
      redirect_to end_users_path
    else
      render "edit"
    end
  end

  def unsubscribe
    @end_user = EndUser.find(current_end_user.id)
  end

  def hide
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(is_unsubscribed: false)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana,
                                     :last_name_kana, :zip_code, :address,
                                     :telephone_number, :is_unsubscribed)
  end

end
