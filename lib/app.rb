require 'rubygems'
#require 'bundler'
#Bundler.setup
require 'sinatra/base'
class MyApp < Sinatra::Base

  get '/' do
    "Hello world, it's #{Time.now} at the server!"
  end
end