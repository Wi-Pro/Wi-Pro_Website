class DataController < ApplicationController
  def index
    fname = "data_file.txt"
    fd = File.open(fname, "w")
    fd.puts params[:t]
    fd.close
  end
  def clearflags
    wiproid = params[:wiproid]
    fname = "flagfile.txt"
    fdir = "/home/rails/public/uploads/hex/#{wiproid}/"
    flagfile = File.open(fdir + fname, "w+")
    flagfile.write("0 0 0")
    flagfile.close
    redirect_to "/"
  end
end
