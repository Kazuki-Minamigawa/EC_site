class ItemsController < ApplicationController
  before_action :correct_user, only: [:show]
  def top
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction,
                                 :is_sold, :no_tax_price, :image)
  end
end
