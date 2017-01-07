require 'sinatra'
require 'json'

module BuildNotifications
  class Application < Sinatra::Base

    get '/health' do
      200
    end

    get '/rules' do
      body(JSON.dump(settings.rules.map { |rule| rule.to_object }))
      status(200)
    end
  end
end