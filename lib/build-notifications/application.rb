require 'sinatra'


module BuildNotifications
  class Application < Sinatra::Base
    get '/health' do
      200
    end
  end
end