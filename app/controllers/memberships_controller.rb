class MembershipsController < ApplicationController
  def index
    @groups = Group.all
    @users = User.all
    @membership = Membership.new
  end
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      username = User.find(@membership.userid)
      groupname = Group.find(@membership.groupid)
      flash[:success] = "#{username.name} has been added to #{groupname.name}"
      redirect_to "/memberships"
    else
      render "index"
    end
  end

private
  def membership_params
    params.require(:membership).permit(:groupid, :userid)
  end
end
