class Postnr < Sinatra::Base
  helpers Sinatra::Jsonp


  get '/city/:zip_code' do
    # content_type 'application/javascript'
    response['Access-Control-Allow-Origin'] = "*"
    city = REDIS.get("zip:#{params[:zip_code]}")
    city
  end
end