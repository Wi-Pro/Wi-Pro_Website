class CheckoutController < ApplicationController
  def index
    @user = User.where(id: current_user.id)
    @list = Membership.where(userid: current_user.id)
  end
end
