class DataController < ApplicationController
  def index
    fname = "data_file.txt"
    fd = File.open(fname, "w")
    fd.puts "Am I there?"
    fd.close
  end
end
