require 'build-notifications/application'

module BuildNotifications
  describe Application do
    include RSpecMixin

    it 'is healthy' do
      get '/health'

      expect(last_response).to be_ok
    end

    it 'shows rules' do
      Application.set :rules, [RulesParser::Rule.new('FAILED', [])]

      get '/rules'

      expect(last_response.body).to be == '[{"build_status":"FAILED","recipients":[]}]'
    end
  end
end