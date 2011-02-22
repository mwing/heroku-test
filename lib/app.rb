require 'rubygems'
#require 'bundler'
#Bundler.setup
require 'sinatra/base'
require 'mongo_mapper'
require File.join(File.dirname(__FILE__), 'docs')

MongoMapper.connection = Mongo::Connection.from_uri(ENV["MONGOHQ_URL"]) if ENV["MONGOHQ_URL"]
MongoMapper.database = "mydb"
class MyApp < Sinatra::Base
  get '/' do
    "Hello world, it's #{Time.now} at the server!"
  end
  
  get "/add/:item" do
    item = Item.create(:item => params[:item])
    item.id
  end
end