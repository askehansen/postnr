class Postnr < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/city/:zip_code' do
    response['Access-Control-Allow-Origin'] = '*'
    REDIS.get("zip:#{params[:zip_code]}")
  end

  get '/city/:country_code/:zip_code' do
    response['Access-Control-Allow-Origin'] = '*'
    REDIS.get("zip:#{params[:country_code]}:#{params[:zip_code]}")
  end

  get '/city/:country_code/' do
    ''
  end

  get '/city/' do
    ''
  end

end
