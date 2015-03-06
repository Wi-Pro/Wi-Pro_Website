class HexesController < ApplicationController
  def index
    @hex = Hex.new
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
      redirect_to hexes_path, success: "Programming Initiated!"
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
