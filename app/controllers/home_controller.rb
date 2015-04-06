class HomeController < ApplicationController
  def index
    if !logged_in
      redirect_to "/login"
    else
      redirect_to "/checkouts"
    end
  end
end
