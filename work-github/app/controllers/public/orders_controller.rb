class Public::OrdersController < ApplicationController

    
    def index
    end
    
    def show
    end
    
     def new
       @order = Order.new
     end
     
     def check
       @order = Order.new(order_params)
       @price_all = 0
       @order.postage = 800
       
       if params[:order][:delivery_method] == "0"
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = current_customer.first_name + current_customer.last_name
  
       elsif params[:order][:delivery_method] == "1"
         @delivery = Delivery.find(params[:order][:delivery_id])
         @order.postal_code = @delivery.postal_code
         @order.address = @delivery.address
         @order.name = @delivery.name
         
       elsif params[:order][:delivery_method] == "2"
         @delivery = current_customer.deliveries.new
         @delivery.address = params[:order][:address]
         @delivery.postal_code = params[:order][:postal_code]
         @delivery.name = params[:order][:name]
         @delivery.save
         @order.address = @delivery.address
         @order.postal_code = @delivery.postal_code
         @order.name = @delivery.name
       end
       
     end
    
      def create
       
      end
    
     def complete
     end
    
    private
    
     def order_params
      params.require(:order).permit(:payment, :postal_code, :address, :name)
     end
    
end
