require "rubygems"
require "sinatra"
require "sinatra/json"
require "redis"

configure do
  REDIS = Redis.new
end

configure :production do
  require 'newrelic_rpm'

  redis_uri = URI.parse(ENV["REDISCLOUD_URL"])
  REDIS = Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
end



require File.expand_path '../app.rb', __FILE__

run Postnr
