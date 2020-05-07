class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品が登録されました。"
      redirect_to admin_item_path(@item.id)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction,
                                 :is_sold, :no_tax_price, :image)
  end
end
