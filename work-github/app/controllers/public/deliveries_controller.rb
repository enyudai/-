class Public::DeliveriesController < ApplicationController

  def create
    #Delivery.create(params[:customer])
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to"/deliveries"
  end

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to"/deliveries"
  end

  def destroy
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end
end
