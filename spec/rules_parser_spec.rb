require_relative '../lib/build-notifications/rules_parser'
require 'json'

describe RulesParser do
  it 'parses build status' do
    json = <<-eos
      [{
        "build_status": "PASSED"
      }]
    eos

    rules = RulesParser.parse(json)

    expect(rules[0].build_status).to be == 'PASSED'
  end

  it 'parses recipients' do
    json = <<-eos
      [{
        "recipients": ["info@foo.com"]
      }]
    eos

    rules = RulesParser.parse(json)

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

    rules = RulesParser.parse(json)

    expect(rules[0].build_status).to be == "PASSED"
    expect(rules[1].build_status).to be == "FIXED"
  end
end