class ReaderController < ApplicationController

  def show
    if request.params[:_pjax] == '#feed-item'
      @item = Item.find params[:item_id]
      render partial: 'item', locals: {item: @item}
    else
      if params[:query]
        @items = Item.search_by_text(params[:query])
      else
        if params[:channel_id]
          @channel = Channel.find(params[:channel_id])
          @items = @channel.items
        else
          @items = Item.all
        end
      end
      @channels = Channel.all
      @items = @items.order(id: :desc).page(params[:page]).per 20
      if params[:item_id]
        @item = @items.find params[:item_id]
      else
        @item = @items.first
      end
    end
  end

end
