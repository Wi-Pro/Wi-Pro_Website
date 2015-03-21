class CheckoutsController < ApplicationController
  def index
    @list = Membership.where(userid: current_user.id)
    @checkout = Checkout.new
    @checkouts = Checkout.where('updated_at > ?', 30.minutes.ago)
  end

  def create
    @checkout = Checkout.new(checkout_params)
    @checkout.userid = current_user.id
    if @checkout.save
      flash[:success] = "Checked out!"
      redirect_to "/hexes"
    else
      render 'index'
    end
  end

  private

  def checkout_params
    params.require(:checkout).permit(:userid, :wiproid)
  end
end
