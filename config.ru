require 'dashing'
require 'jmx'

server = JMX.simple_server
client = JMX.connect
$memory = client["java.lang:type=Memory"]
$jruby_parser = client["org.jruby:type=Runtime,name=0,service=ParserStats"]
$jruby_runtime = client["org.jruby:type=Runtime,name=0,service=Runtime"]

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
