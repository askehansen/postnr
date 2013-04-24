require "sinatra"

get '/:zip_code' do
  "Hello #{params[:zip_code]}"
end