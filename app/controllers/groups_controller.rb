class GroupsController < ApplicationController
  def index
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to "/", success: "Group Added!"
    else
      flash[:danger] = "Error"
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
