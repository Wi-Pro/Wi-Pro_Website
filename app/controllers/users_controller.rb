class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      debugger
  end

  def new
    @user = User.new
  end

  def index
    redirect_to "/"
  end
end
