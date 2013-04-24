require "sinatra"
require "redis"

redis_uri = URI.parse("redis://rediscloud:qio1X6LTlJUnJDhU@pub-redis-18882.us-east-1-1.1.ec2.garantiadata.com:18882")
REDIS = Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)

get '/city/:zip_code' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  REDIS.get "zip:#{params[:zip_code]}"
end