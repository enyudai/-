class Admin::HomesController < ApplicationController
  def top
    @volume = 0
    @order = Order.page(params[:page]).per(8)
  end
end
