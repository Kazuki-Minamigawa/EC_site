class AddressesController < ApplicationController
  before_action :correct_user
  def index
    @address = Address.new
    @addresses = Address.where(end_user_id: current_end_user.id)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    flash[:notice] = "配送先住所を登録しました。"
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    flash[:notice] = "配送先住所を編集しました。"
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "配送先住所を削除しました。"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:end_user_id, :address, :zip_code, :name)
  end
end
