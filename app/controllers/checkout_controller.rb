class CheckoutController < ApplicationController
  def index
    @user = User.update.where(id: current_user.id).find(current_user.id)
    @list = Membership.where(userid: current_user.id)
    availwp = Hash.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Checked out!"
      redirect_to "/hexes"
    else
      render 'index'
    end
  end

  private

  def user_params
    params.require(:user).permit(:checkoutid)
  end
end
