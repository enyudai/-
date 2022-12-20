class Public::HomesController < ApplicationController
  def top
    @items = Item.order('id DESC').limit(4)
    #@items = Item.limit(4).order(" created_at DESC ")
  end

  def about
  end
end