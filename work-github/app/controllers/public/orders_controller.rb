class Public::OrdersController < ApplicationController
    
    def index
    end
    
    def show
    end
    
    def new
      @a = current_customer
    end
    
end
