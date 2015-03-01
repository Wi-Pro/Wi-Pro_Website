class WiproidsController < ApplicationController
  def index
    @wiproid = Wiproid.new
  end

  def admin
    @wiproid = Wiproid.all
  end

  def new
    @wiproid = Wiproid.new
  end

  def create
    @wiproid = Wiproid.new(wiproid_params)
    if @hex.save
      redirect_to wiproid_path, notice: "The WiPro #{@wiproid.name} has been added"
    else
      render "new"
    end
  end

  def destroy
    @wiproid = Wiproid.find(params[:id])
    @wiproid.destroy
    redirect_to wiproid_path, notice: "The WiPro #{@wiproid.name} has been deleted"
  end
private
  def wiproid_params
    params.require(:wiproid).permit(:name, :wiproid, :userid)
  end
end
