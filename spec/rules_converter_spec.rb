require 'json'

class Rule
  def initialize(build_status, recipients)
    @build_status = build_status
    @recipients = recipients
  end

  attr_reader :build_status, :recipients
end

def convert(json)
  parsed_json = JSON.parse(json)
  return [Rule.new(parsed_json[0]["build_status"], parsed_json[0]["recipients"])]
end

describe "rules_converter" do
  it 'parses build status' do
    json = <<-eos
      [{
        "build_status": "PASSED"
      }]
    eos

    rules = convert(json)

    expect(rules[0].build_status).to be == 'PASSED'
  end

  it 'parses single recipient' do
    json = <<-eos
      [{
        "recipients": ["info@foo.com"]
      }]
    eos

    rules = convert(json)

    expect(rules[0].recipients).to be == ["yves.bonjour@gmail.com"]
  end
end