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
      directory_name = "/home/rails/public/uploads/hex/#{@wiproid.wiproid}"
      Dir.mkdir(directory_name) unless File.exists?(directory_name)
      flash[:success] = "The WiPro #{@wiproid.wiproid} has been added"
      File.new("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/default.hex", "w+")
      #`touch /home/rails/public/uploads/hex/#{@wiproid.wiproid}/default.hex`
      #FileUtils.touch("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/default.hex")
      #hex_file.close
      flag_file = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt", "w+")
      flag_file.write("0 0")#Programming and SSID Scan are the two flags
      flag_file.close
      #`touch /home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt`
      #flags_file.close
      File.new("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/deviceinfo.txt", "w+")
      #`touch /home/rails/public/uploads/hex/#{@wiproid.wiproid}/deviceinfo.txt`
      #device_file.close
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
