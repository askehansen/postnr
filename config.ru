require "rubygems"
require "sinatra"
require "redis"
require "sinatra/jsonp"

configure :production do
  require 'newrelic_rpm'
end

configure do
  redis_uri = URI.parse("redis://rediscloud:qio1X6LTlJUnJDhU@pub-redis-18882.us-east-1-1.1.ec2.garantiadata.com:18882")
  REDIS = Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
end

require File.expand_path '../app.rb', __FILE__

run Postnr