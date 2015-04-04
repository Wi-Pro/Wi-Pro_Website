class SsidsController < ApplicationController
  def index
    @ssid = Ssid.new
    @list = Array.new
    regex = /(\d+\s+\d+\s+\D+\d+\D+.{18})/
    if Checkout.where("userid = ?", current_user.id).last
      @wiproid = Wiproid.find(Checkout.where(userid: current_user.id).last.wiproid)
      flagfile = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt", "w+")
      flagfile.write("0 1 0")
      flagfile.close
      @name = File.open("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/ssid.txt", "r")
      @name.each do |line|
        line.gsub!(regex, "\n").each do |l|
        @list.push(l.tr("\n", ""))
      end
      @name.close
      @list.reject! { |r| r.empty? }
      @list.uniq!
    end
  end
  def create
    @ssid = Ssid.new(ssid_params)
    if @ssid.save
      ssid_file = File.open("/home/rails/public/uploads/hex/#{@ssid.wiproid}/wifi.txt", "w+")
      ssid_file.write("#{@ssid.ssid}, #{@ssid.password}")
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
