class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if cart_item = CartItem.find_by(item_id: @cart_item.item_id)
      cart_item.amount += @cart_item.amount
      cart_item.save
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:notice] = "カート内の数量をを変更しました。"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "カート内商品を削除しました。"
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.where(end_user_id: current_end_user.id).destroy_all
    flash[:notice] = "カート内商品を全て削除しました。"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
  end
end
