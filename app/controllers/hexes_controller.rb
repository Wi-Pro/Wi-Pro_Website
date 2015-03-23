class HexesController < ApplicationController
  def index
    @hex = Hex.new
    @devices = Device.all
    $globaluserid = current_user.id
    checkout = Checkout.where("userid = ?", current_user.id).last.wiproid
    @wiproid = Wiproid.find(checkout)
  end

  def admin
    @hexes = Hex.all
  end

  def new
    @hex = Hex.new
  end

  def create
    @hex = Hex.new(hex_params)
    if @hex.save
      flash[:success] = "Programming Initiated!"
      file = File.new("uploads/hex/#{@hex.wiproid}/deviceinfo.txt", "w+")
      file.write("Name: #{Device.find(@hex.deviceid).name}, #{Device.find(@hex.deviceid).signature}, flash: #{Device.find(@hex.deviceid).flash_size}, pins: #{Device.find(@hex.deviceid).pin_count}")
      file.close
      redirect_to hexes_path
    else
      render "index"
    end
  end

  def destroy
    @hex = Hex.find(params[:id])
    @hex.destroy
    redirect_to hexes_path, alert: "The hex file #{@hex.name} has been deleted"
  end
private
  def hex_params
    params.require(:hex).permit(:name, :attachment, :wiproid, :deviceid)
  end
end
