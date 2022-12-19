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
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to deliveries_path(@delivery)
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to '/deliveries'
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end

  #def update_params
  #  params.permit(:postal_code, :address, :name)
  #end
end
