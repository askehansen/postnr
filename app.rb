class Postnr < Sinatra::Base
  helpers Sinatra::Jsonp


  get '/city/:zip_code' do
    content_type 'application/javascript'
    city = REDIS.get("zip:#{params[:zip_code]}")
    jsonp city
  end
end