require "redis"
require "CSV"

def redis
  @_redis ||= begin
    if ENV["REDISCLOUD_URL"]
      redis_uri = URI.parse(ENV["REDISCLOUD_URL"])
      Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
    else
      Redis.new
    end
  end
end

task :import do
  %w( DK ).each do |country_code|
    CSV.read("data/#{country_code}/postnumre.csv", col_sep: ";").each do |zipcode, city|
      puts redis.set("zip:#{country_code.downcase}:#{zip_code}", city)
    end
  end
end
