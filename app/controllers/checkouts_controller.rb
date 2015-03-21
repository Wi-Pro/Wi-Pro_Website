class CheckoutsController < ApplicationController
  def index
    @list = Membership.where(userid: current_user.id)
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)
    @checkout.userid = current_user.id
    if @checkout.save
      flash[:success] = "Checked out!"
      redirect_to "/hexes"
    else
      redirect_to "/groups"
    end
  end

  private

  def checkout_params
    params.require(:user).permit(:userid, :wiproid)
  end
end
