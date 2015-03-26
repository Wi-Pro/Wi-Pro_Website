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
      redirect_to "/" #I think it makes more sense to send them back here, but for flow we send them back home to keep reading instructions
    else
      render "index"
    end
  end

private
  def membership_params
    params.require(:membership).permit(:groupid, :userid)
  end
end
