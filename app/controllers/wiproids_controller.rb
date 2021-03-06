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
      flagfile = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt", "w+")
      flagfile.write("010")#Programming and SSID Scan are the two flags set SSID scan high for first initial scan.
      flagfile.close
      ssid_file = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/ssid.txt", "w+")
      ssid_file.write(" 0  1  -51 6C:B0:CE:B8:A2:9E Wi-Pro  1  1  -45 20:4E:7F:12:3F:1C Daycare  2  1  -68 68:BD:AB:67:2C:C2 UNOGuest  3  1  -69 00:06:5A:00:EA:51 WiFi Research Network  4  1  -68 68:BD:AB:67:2C:C1 UNOSecure  5  1  -74 68:BD:AB:67:35:92 UNOGuest  6  1  -74 68:BD:AB:67:35:91 UNOSecure  7  1  -69 68:BD:AB:67:2C:C0 eduroam  8 11  -41 30:46:9A:60:7F:08 dickbutt  9 11  -57 68:BD:AB:67:56:52 UNOGuest 10 11  -81 AE:7C:A4:C2:7F:B6 PJ-WIRELESS5 11 11  -57 68:BD:AB:67:56:51 UNOSecure 12 11  -84 68:BD:AB:67:56:50 eduroam
")
      ssid_file.close
      #`touch /home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt`
      #flags_file.close
      File.new("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/deviceinfo.txt", "w+")
      #`touch /home/rails/public/uploads/hex/#{@wiproid.wiproid}/deviceinfo.txt`
      #device_file.close
      redirect_to "/data/ping?wiproid=#{@wiproid.wiproid}"
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
