require 'rack'
require './app'

app = App.new({
	:memcachedurl => 'localhost:11211'
	})

run app