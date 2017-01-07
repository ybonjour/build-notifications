require 'json'

class Rule
  def initialize(build_status)
    @build_status = build_status
  end

  attr_reader :build_status
end

def convert(json)
  parsed_json = JSON.parse(json)
  return [Rule.new(parsed_json[0]["build_status"])]
end

describe "rules_converter" do
  it 'Should convert a single rule to a rule object' do
    json = <<-eos
      [{
        "build_status": "PASSED"
      }]
    eos

    rules = convert(json)

    expect(rules[0].build_status).to be == 'PASSED'
  end
end