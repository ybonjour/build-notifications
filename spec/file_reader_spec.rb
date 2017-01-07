require "build-notifications/file_reader"

describe BuildNotifications::FileReader do
  subject { BuildNotifications::FileReader.new(File.expand_path("../", __FILE__)) }

  it 'can read a file' do
    file = "multiline_file.txt"
    content = subject.read_file(file)
    expect(content).to be == "A file with\nmultiple lines"
  end
end