module BuildNotifications
  module RulesParser
    class Rule
      def initialize(build_status, recipients)
        @build_status = build_status
        @recipients = recipients
      end

      def to_object
        {"build_status" => build_status, "recipients" => recipients}
      end

      def self.from_json(json)
        Rule.new(json["build_status"], json["recipients"])
      end

      attr_reader :build_status, :recipients
    end

    def self.parse(json)
      JSON.parse(json).map { |rule_json| Rule.from_json(rule_json)}
    end
  end
end