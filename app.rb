require 'rack'
require 'dalli'

class App
	attr_accessor :memcachedurl, :cacheclient

  def initialize settings
		@memcachedurl = settings[:memcachedurl]
		@cacheclient = Dalli::Client.new @memcachedurl
  end

  def call env
  	request = Rack::Request.new env
  	response = Rack::Response.new
		response.body=   	

  	response.finish
  end
end
