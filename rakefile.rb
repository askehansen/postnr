require "redis"

def redis
  redis_uri = URI.parse(ENV["REDISCLOUD_URL"])
  Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
end

task :import do
  %w( DK NO SE ).each do |country_code|
    File.open("data/#{country_code}/#{country_code}.txt") do |file|
      file.each_line do |line|
        data = line.split("\t")
        zip_code = data[1]
        city = data[2]
        redis.set("zip:#{country_code.downcase}:#{zip_code}", city)
      end
    end
  end
end