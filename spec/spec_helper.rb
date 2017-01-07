$:.push File.expand_path("../../lib", __FILE__)

require "rack/test"

require "build-notifications/application"

ENV["RACK_ENV"] = "test"

module RSpecMixin
  include Rack::Test::Methods
  def app() BuildNotifications::Application end
end