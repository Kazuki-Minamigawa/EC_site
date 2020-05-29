class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(made_process_params)

    if @order_detail.made_process == "making"
      @order = @order_detail.order
      @order.update(ordered_process: "making")
    end

    @order_details = @order_detail.order.order_details
    if (@order_details.where(made_process: "done")).count == @order_details.count
      @order = @order_detail.order
      @order.update(ordered_process: "preparing")
    end

    redirect_to admin_order_path(@order_detail.order.id)
  end

  private
  def made_process_params
    params.require(:order_detail).permit(:made_process)
  end
end
