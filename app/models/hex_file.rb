class HexFile < ActiveRecord::Base
  def self.save(upload)
    name =  upload['hexfile'].original_filename
    directory = "public/hex"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['hexfile'].read) }
  end
end
