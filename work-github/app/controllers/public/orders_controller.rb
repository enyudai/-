class Public::OrdersController < ApplicationController


    def index
     @orders = current_customer.orders.all
    end



    def show
      @order = Order.find(params[:id])
      @order_detail = OrderDetail.find(params[:id])
    end

     def new
       @order = Order.new
     end

     def check
       @order = Order.new(order_params)
       @price_all = 0
       @order.postage = 800
       @cart_item = current_customer.cart_items.all

       if params[:order][:delivery_method] == "0"
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address

          @order.name = current_customer.first_name + current_customer.family_name


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
       @order = Order.new(order_params)
       @order.save
       current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.item_id = cart_item.item_id
        @order_detail.volume  = cart_item.volume
        @order_detail.order_id = @order.id
        @order_detail.save
       end
        current_customer.cart_items.destroy_all
        redirect_to orders_complete_path
      end


    private

     def order_params
      params.require(:order).permit(:payment, :postal_code, :address, :name, :price, :postage, :customer_id)
     end


end
