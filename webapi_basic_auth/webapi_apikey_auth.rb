# webapi_apikey_auth.rb
require 'sinatra'
require 'json'

API_KEY = 'ZmvhBBpb4RlbyblpKoj9F716CoONTOtr'

before do
  auth = env['HTTP_AUTHORIZATION']
  unless auth && auth.match(/Key #{API_KEY}/)
    response.headers['WWW-Authenticate'] = 'Key realm="User Realm"'
    halt 401
  end
end

get '/' do
  ' Ruby Web APIs  '
end
