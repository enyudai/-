class Admin::HomesController < ApplicationController
  def top
    @volume = 0
    @order = Order.all
  end
end
