class ChannelsController < ApplicationController
  before_action :set_channel, only: [:avatar, :destroy]

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to reader_path, notice: 'Feed list was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Feed list was successfully destroyed.' }
      format.json { head :no_content }
    end
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
