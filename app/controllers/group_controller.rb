class GroupController < ApplicationController
  def index
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path, success: "Group Added!"
    else
      flash[:danger] = "Error"
      render "index"
    end
  end
private
  def group_params
    params.require(:group).permit(:name)
  end
end
