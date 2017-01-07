require "build-notifications/file_reader"

describe BuildNotifications::FileReader do
  it 'can read a file' do
    file = File.expand_path("../multiline_file.txt", __FILE__)
    content = BuildNotifications::FileReader.read_file(file)
    expect(content).to be == "A file with\nmultiple lines"
  end
end