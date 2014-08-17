require 'jmx'

server = JMX.simple_server
client = JMX.connect
$memory = client["java.lang:type=Memory"]
$jruby_parser = client["org.jruby:type=Runtime,name=0,service=ParserStats"]
$jruby_runtime = client["org.jruby:type=Runtime,name=0,service=Runtime"]

