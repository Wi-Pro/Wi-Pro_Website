class CheckoutsController < ApplicationController
  def index
    @list = Membership.where(userid: current_user.id)
    @id_list = Array.new
    @final_list = Array.new
    @final_hash = Hash.new
    @group_list = Membership.where("userid = ?", current_user.id).pluck(:groupid)
    @group_list.each do |l|
      @id_list = @id_list + Wiproid.where("groupid = ?", l).pluck(:id)
    end
    #@group_list = Membership.where("userid = ?", current_user.id).pluck(:groupid)
    @id_list = @id_list.uniq.sort
    @id_list.each do |id|
      @final_hash[Wiproid.find(id).wiproid] = id
    end
    @availability = Wiproavail.where("updated_at > ?", 5.minutes.ago)
    @checkout = Checkout.new
    @checkouts = Checkout.where('updated_at > ?', 30.minutes.ago)#.where("updated_at > ?", )
    $globaluserid = @current_user.id
    @active = Wiproavail.all
  end

  def create
    @checkout = Checkout.new(checkout_params)
    @checkout.userid = current_user.id
    if @checkout.save
      flagfile = File.open("/home/rails/public/uploads/hex/#{Wiproid.find(@checkout.wiproid).wiproid}/flagfile.txt", "w+")
      flagfile.write("010")
      flagfile.close
      flash[:success] = "Checked out!"
      redirect_to "/"
    else
      render 'index'
    end
  end

  private

  def checkout_params
    params.require(:checkout).permit(:userid, :wiproid)
  end
end
