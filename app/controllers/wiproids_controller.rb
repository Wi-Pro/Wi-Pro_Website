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
      File.new("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/default.hex", "r+")
      #hex_file.close
      File.new("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/flagfile.txt", "r+")
      #flags_file.close
      File.new("/home/rails/public/uploads/hex/#{@wiproid.wiproid}/deviceinfo.txt", "r+")
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
