require 'json'

class Rule
  def initialize(build_status, recipients)
    @build_status = build_status
    @recipients = recipients
  end

  attr_reader :build_status, :recipients
end

def convert(json)
  JSON.parse(json).map { |rule_json| Rule.new(rule_json["build_status"], rule_json["recipients"]) }
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

  it 'parses recipients' do
    json = <<-eos
      [{
        "recipients": ["info@foo.com"]
      }]
    eos

    rules = convert(json)

    expect(rules[0].recipients).to be == ["info@foo.com"]
  end

  it 'parses multiple rules' do
    json = <<-eos
      [{
        "build_status": "PASSED"
      }, {
        "build_status": "FIXED"
      }]
    eos

    rules = convert(json)

    expect(rules[0].build_status).to be == "PASSED"
    expect(rules[1].build_status).to be == "FIXED"
  end
end