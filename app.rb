class Postnr < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/city/:zip_code' do
    response['Access-Control-Allow-Origin'] = '*'
    REDIS.get("zip:#{params[:zip_code]}")
  end
end