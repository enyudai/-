class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Item"
      @items = Item.looks(params[:search], params[:word])
    else
      @jenres = Jenre.looks(params[:search], params[:word])
    end
  end
end
