class SsidsController < ApplicationController
  def index
    @ssid = Ssid.new
  end
  def create
    @ssid = Ssid.new(ssid_params)
    if @ssid.save
      flash[:success] = "Wireless Network Saved!"
      redirect_to "/"
    else
      render "index"
    end
  end
  def refresh
    redirect_to "/ssids"
  end
private
  def ssid_params
    params.require(:ssid).permit(:wiproid, :ssid, :password)
  end
end
