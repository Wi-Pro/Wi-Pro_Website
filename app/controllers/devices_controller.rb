class DevicesController < ApplicationController
  def index
    @device = Device.new
  end

  def admin
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.signature = @device.signature.hex
    if @device.save
      flash[:success] = "The device #{@device.name} has been added"
      redirect_to "/"
    else
      render "index"
    end
  end
private
  def device_params
    params.require(:device).permit(:name, :signature, :flash_size, :pin_count)
  end
end
