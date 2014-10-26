class ChannelsController < ApplicationController
  before_action :set_channel, only: [:avatar, :destroy]

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to reader_url, notice: 'Feed list was successfully created.'
    else
      render :new 
    end
  end

  def destroy
    @channel.destroy
    redirect_to reader_url, notice: 'Feed list was successfully destroyed.'
  end

  def avatar
    avatar = @channel.avatar
    avatar = avatar.thumb if params[:thumb]
    send_data avatar.file.read, type: 'image/png', disposition: 'inline'
  end

  private
  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:url)
  end
end
