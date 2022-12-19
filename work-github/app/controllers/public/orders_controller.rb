class Public::OrdersController < ApplicationController

    
    def index
    end
    
    def show
    end
    
    def new
    @order = Order.new(order_params)
    binding.pry
    @address = Delivery.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    end
    def check
      
    end
    
    private
    
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end
    
end
