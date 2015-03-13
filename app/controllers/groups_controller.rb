class GroupsController < ApplicationController
  def index
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Group Added!"
      redirect_to "/"
    else
      flash[:danger] = "Group Name Taken!"
      render "index"
    end
  end

  def show
    redirect_to "/"
  end
private
  def group_params
    params.require(:group).permit(:name)
  end
end
