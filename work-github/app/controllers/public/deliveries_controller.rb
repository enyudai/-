class Public::DeliveriesController < ApplicationController

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to"/deliveries/index"
  end

  def index
    @delivery = Delivery.new(delivery_params)
    @deliveries = Delivery.all
  end

  def edit
  end

  private
  def delivery_params
    params.require(:delivery).permit(:string)
  end
end
