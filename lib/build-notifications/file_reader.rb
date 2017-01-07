module BuildNotifications
  class FileReader
    def self.read_file(full_filename)
      File.open(full_filename) { |f| f.read }
    end
  end
end