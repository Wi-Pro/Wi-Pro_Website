class CheckoutController < ApplicationController
  def index
    @hex = Hex.new
    if @hex.save
      redirect_to hexes_path, success: "Wi-Pro Checked Out!"
    else
      render "index"
    end
  end
end
