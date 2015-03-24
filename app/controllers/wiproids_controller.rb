class WiproidsController < ApplicationController
  def index
    @wiproid = Wiproid.new
  end

  def admin
    @wiproids = Wiproid.all
  end

  def new
    @wiproid = Wiproid.new
  end

  def create
    @wiproid = Wiproid.new(wiproid_params)
    @wiproid.userid = current_user.id
    if @wiproid.save
      flash[:success] = "The WiPro #{@wiproid.wiproid} has been added"
      hex_file = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/default.hex", "w+")
      hex_file.close
      flags_file = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt", "w+")
      flags_file.close
      device_file = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/deviceinfo.txt", "w+")
      device_file.close
      redirect_to "/"
    else
      render "index"
    end
  end

  def destroy
    @wiproid = Wiproid.find(params[:id])
    @wiproid.destroy
    flash[:danger] = "The WiPro #{@wiproid.wiproid} has been deleted"
    redirect_to wiproids_path
  end
private
  def wiproid_params
    params.require(:wiproid).permit(:name, :wiproid, :groupid)
  end
end
