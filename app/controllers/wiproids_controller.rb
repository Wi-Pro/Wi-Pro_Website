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
      redirect_to "/", success: "The WiPro #{@wiproid.name} has been added"
    else
      render "index"
    end
  end

  def destroy
    @wiproid = Wiproid.find(params[:id])
    @wiproid.destroy
    redirect_to wiproids_path, alert: "The WiPro #{@wiproid.name} has been deleted"
  end
private
  def wiproid_params
    params.require(:wiproid).permit(:name, :wiproid, :groupid)
  end
end
