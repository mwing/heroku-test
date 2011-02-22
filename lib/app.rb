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
  
  #get for now, can't be arsed to do a form for post
  get "/add/:item" do
    item = Item.new(:item => params[:item])
    item.save # Heh, 3 lines for a one-liner :)
    item.id
  end
  
  get "/list" do
    Item.all.to_json
  end
  
  get "/delete/:id" do
    Item.find_by_id(params[:id]).delete
  end
  
  get "/count" do
    Item.all.count.to_s
  end
end