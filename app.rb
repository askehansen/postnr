class Postnr < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/cities/:country_code/:zip_code' do
    response['Access-Control-Allow-Origin'] = '*'
    keys = REDIS.scan(0, match: "zip:#{params[:country_code]}:#{params[:zip_code]}*", count: 1_000_000)[1]

    result = if keys.any?
      cities = REDIS.mget(keys)
      keys.zip(cities).map do |key, city|
        zip = key.split(':').last
        { zip: zip, city: city }
      end
    else
      []
    end

    json result: result
  end

  get '/city/:zip_code' do
    response['Access-Control-Allow-Origin'] = '*'
    REDIS.get("zip:#{params[:zip_code]}")
  end

  get '/city/:country_code/:zip_code' do
    response['Access-Control-Allow-Origin'] = '*'
    REDIS.get("zip:#{params[:country_code]}:#{params[:zip_code].gsub(' ', '')}")
  end

  get '/city/:country_code/' do
    ''
  end

  get '/cities/:country_code/' do
    json result: []
  end

  get '/city/' do
    ''
  end

end
