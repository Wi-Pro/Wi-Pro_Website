class DataController < ApplicationController
  def index
    fname = "data_file.txt"
    fd = File.open(fname, "w")
    somefile.puts "Am I there?"
    somefile.close
  end
end
