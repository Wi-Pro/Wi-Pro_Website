class DataController < ApplicationController
  def index
    fname = "data_file.txt"
    fd = File.open(fname, "w")
    fd.puts params[:t]
    fd.close
  end
end
