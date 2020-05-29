class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(ordered_process_params)

    @order_details = @order.order_details
    @order_details.each do |order_detail|
      if @order.ordered_process == "checked"
        #order_detail.made_process = "waiting"
        order_detail.update(made_process: "waiting")
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def ordered_process_params
    params.require(:order).permit(:ordered_process)
  end
end
