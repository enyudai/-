class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details

    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(reception_status: "in_production") if @order_detail.production_status == "making"

      @order_details.each do |order_detail|
        if order_detail.production_status != "completed"
          is_updated = false
        end
      end

      @order.update(reception_status: "preparing_delivery") if is_updated
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
