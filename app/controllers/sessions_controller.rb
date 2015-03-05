class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome Back!"
      redirect_to "/hexes"
    else
      flash.now[:alert] = "Invalid Email/Password"
      render 'new'
    end
  end

  def destroy
  end
end
