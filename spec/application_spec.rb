require 'build-notifications/application'

describe BuildNotifications::Application do
  include RSpecMixin

  it 'is healthy' do
    get '/health'

    expect(last_response).to be_ok
  end
end