require 'rubygems'
#require 'bundler'
#Bundler.setup
require 'sinatra/base'
require 'mongo_mapper'

class MyApp < Sinatra::Base

MongoMapper.connection = Mongo::Connection.from_uri(ENV["MONGOHQ_URL"]) if ENV["MONGOHQ_URL"]
  get '/' do
    "Hello world, it's #{Time.now} at the server!"
  end
end