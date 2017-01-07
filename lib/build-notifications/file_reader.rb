module BuildNotifications
  class FileReader
    def initialize(base_path)
      @base_path = base_path
    end

    def read_file(file)
      full_filename = File.expand_path(file, base_path)
      File.open(full_filename) { |f| f.read }
    end

    private
    attr_reader :base_path
  end
end