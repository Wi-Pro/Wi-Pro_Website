class HexesController < ApplicationController
  def index
    @hex = Hex.new
    @devpref = Devicepreference.new
    @device = Devicepreference.where("userid = ?", current_user.id).last
    @devices = Device.all
    $globaluserid = current_user.id
    if Checkout.where("userid = ?", current_user.id).last == nil
      first_time = Checkout.new
      first_time.userid = current_user.id
      first_time.wiproid = 1
      if first_time.save
        redirect_to "/checkouts"
      end
    else
      @checkout = Checkout.where("userid = ?", current_user.id).last.wiproid
      @wiproid = Wiproid.find(@checkout)
    end
  end

  def admin
    @hexes = Hex.all
  end

  def new
    @hex = Hex.new
  end

  def chunker f_in, out_pref
    chunksize = 7_500
    unless File.directory?("/home/rails/public/uploads/hex/#{@hex.wiproid}/split/")
      FileUtils.mkdir_p("/home/rails/public/uploads/hex/#{@hex.wiproid}/split/")
    end
    #FileUtils.rm("/home/rails/public/uploads/hex/#{@hex.wiproid}/#{out_pref/[0-9]}.hex")
    #File.delete("/home/rails/public/uploads/hex/#{@hex.wiproid}/#{out_pref}")
    FileUtils.rm_rf(Dir.glob("/home/rails/public/uploads/hex/#{@hex.wiproid}/split/*"))
    File.open("/home/rails/public/uploads/hex/#{@hex.wiproid}/#{f_in}","r") do |fh_in|
      until fh_in.eof?
        File.open("/home/rails/public/uploads/hex/#{@hex.wiproid}/split/#{out_pref}#{"%01d"%(fh_in.pos/chunksize)}.hex","w") do |fh_out|
          fh_out << fh_in.read(chunksize)
        end
      end
    end
  end

  def create
    @hex = Hex.new(hex_params)
    @devpref = Devicepreference.where("userid = ?", current_user.id).last
    if(@devpref == nil)
      @devpref = Devicepreference.new
      @devpref.userid = current_user.id
    end
    @devpref.deviceid = @hex.deviceid
    #@devpref = Devicepreference.new(dev_params)
    if @hex.save
      @devpref.save
      flash[:success] = "Programming Initiated!"
      device_file = File.open("/home/rails/public/uploads/hex/#{@hex.wiproid}/deviceinfo.txt", "w+")
      device_file.write("#{Device.find(@hex.deviceid).id}")
      device_file.close
      flagfile = File.open("/home/rails/public/uploads/hex/#{@hex.wiproid}/flagfile.txt", "w+")
      flagfile.write("100")
      flagfile.close
      #system("split /public/uploads/hex/#{@hex.wiproid}/default.hex -b 8000 -a 1 -d split")
      chunker "default.hex", "split"
      @checkout = Checkout.where("userid = ?", current_user.id).last
      @checkout.touch
      @checkout.save
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
  #def dev_params
  #  params.require(:devicepreference).permit(:deviceid, :userid)
  #end
end
