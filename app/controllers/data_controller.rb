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
    flagfile.write("000")
    flagfile.close
    redirect_to "/"
  end
  def updatessids
    wiproid = params[:wiproid]
    ssid = params[:ssid]
    fname = "ssid.txt"
    fdir = "/home/rails/public/uploads/hex/#{wiproid}/"
    ssidfile = File.open(fdir + fname, "w+")
    ssidfile.write(ssid)
    ssidfile.close
    redirect_to "/"
  end
end
