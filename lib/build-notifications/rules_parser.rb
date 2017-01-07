module RulesParser
  class Rule
    def initialize(build_status, recipients)
      @build_status = build_status
      @recipients = recipients
    end

    attr_reader :build_status, :recipients
  end

  def self.parse(json)
    JSON.parse(json).map { |rule_json| Rule.new(rule_json["build_status"], rule_json["recipients"]) }
  end
end