class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @price_all = 0
  end

  def create
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      new_volume = @cart_item.volume + params[:cart_item][:volume].to_i
      @cart_item.update_attribute(:volume, new_volume)
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      if @cart_item.save
        redirect_to cart_items_path
      else
        redirect_to request.referer
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :volume)
  end

end
