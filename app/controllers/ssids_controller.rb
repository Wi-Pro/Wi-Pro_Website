class SsidsController < ApplicationController
  def index
    @ssid = Ssid.new
    @list = Array.new
    regex = /(^!.+|^\S+\s+\d+\s+\d+\s+\S+\s+\S+\s+|\n)/
    if Checkout.where("userid = ?", current_user.id).last
      @wiproid = Wiproid.find(Checkout.where(userid: current_user.id).last.wiproid)
      flags_file = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt", "w+")
      flags_file.write("0 1")
      flags_file.close
      @name = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/ssid.txt", "r")
      @name.each do |line|
        line.sub!(regex, "")
        @list.push(line.tr("\n", ""))
      end
      @list.reject! { |r| r.empty? }
      @list.uniq!
    end
  end
  def create
    @ssid = Ssid.new(ssid_params)
    if @ssid.save
      ssid_file = File.open("/home/rails/public/uploads/hex/#{@ssid.wiproid}/wifi.txt", "w+")
      ssid_file.write("SSID: #{@ssid.ssid}, Password: #{@ssid.password}")
      ssid_file.close
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
