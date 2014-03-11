require 'rack'
require 'dalli'

class App
  attr_accessor :memcachedurl, :name, :cacheclient

  def initialize settings
		@memcachedurl = settings[:memcachedurl]
		@name = settings[:name]
		@cacheclient = Dalli::Client.new(@memcachedurl, { 
			:namespace => @name, 
			:compress => true 
			})
  end

  def call env
  	request = Rack::Request.new env
  	response = Rack::Response.new
  	key = 'woohoo'
  	value = @cacheclient.get(key)
  	value = Time.now if value.nil?
  	puts value
  	@cacheclient.set(key, value) if value.nil?

		response.body= ["Here is the value: |#{value}|"]
  	response.finish
  end
end
