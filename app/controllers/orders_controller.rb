class OrdersController < ApplicationController
  before_action :correct_user
  def new
    if current_end_user.cart_items.find_by(end_user_id: current_end_user)
      @order = Order.new
    else
      flash[:notice] = "カート内に商品が存在しません。"
      redirect_to items_path
    end
  end

  def check #post
    @order = Order.new(order_params)
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @order_second = Order.new
    if  params[:order][:address_option] == "0"
      @order.end_user_id = current_end_user.id
      @order.zip_code = current_end_user.zip_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
      #@orders = Order.where(end_user_id: current_end_user.id)
    elsif params[:order][:address_option] == "1"
      info = Address.find(params[:order][:address_id])
      @order.zip_code = info.zip_code
      @order.address = info.address
      @order.name = info.name
    elsif params[:order][:address_option] == "2"
    end
  end

  def thanks
  end

  def create
    @order_second = Order.new(order_params)
    @order_second.save


    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.tax_price = cart_item.item.no_tax_price
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order_second.id
      @order_detail.item_amount = cart_item.amount
      @order_detail.save
    end
      #OrderDetail.create!(
        #tax_price: cart_item.item.no_tax_price,
      #)
    #end
    CartItem.where(end_user_id: current_end_user.id).destroy_all
    redirect_to orders_check_thanks_path
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:end_user_id, :address, :zip_code, :name, :payment_method,
                                  :postage, :total_price, :ordered_process, :image)
  end
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :item_amount, :tax_price, :made_process)
  end
end
