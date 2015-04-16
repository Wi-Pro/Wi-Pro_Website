class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @member = Membership.where(userid: params[:id])
      debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @member = Membership.new
      @member.groupid = 14 #add every new user to the demo group.
      @member.userid = @user.id
      @member.save
      log_in @user
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to "/"
    else
      render 'new'
    end
  end

  def index
    redirect_to "/"
  end

  def edit
    userid = params[:uid]
    @admin = Administrator.new
    @admin.userid = userid
    if @admin.save
      flash[:success] = "Administrative Rights Granted!"
      redirect_to "/"
    else
      flash[:danger] = "Error!"
      redirect_to "/help"
    end
  end

  def update
    @user = User.find(params[:id])
    #@user.checkoutid = 3211233211#params[:checkoutid]
    if @user.save
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:danger] = "Error Didn't Update"
      redirect_to "/"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  def checkout_params
    params.require(:user).permit(:checkoutid)
  end
end
