class MembershipsController < ApplicationController
  def index
    @groups = Group.all
    @users = User.all
    @membership = Membership.new
  end
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      redirect_to "/membership", success: "#{@membership.userid} has been added to #{@membership.groupid}"
    else
      render "index"
    end
  end

private
  def membership_params
    params.require(:membership).permit(:groupid, :userid)
  end
end
