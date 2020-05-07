class ItemsController < ApplicationController
  def top
  end

  def index
    @items = Item.all
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction,
                                 :is_sold, :no_tax_price, :image_id)
  end
end
