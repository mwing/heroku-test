require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra/base'
require 'mongo_mapper'
require 'mustache/sinatra'
require File.join(File.dirname(__FILE__), 'docs')

if ENV["MONGOHQ_URL"]
  MongoMapper.connection = Mongo::Connection.from_uri(ENV["MONGOHQ_URL"]) 
  MongoMapper.database = URI.parse(ENV['MONGOHQ_URL']).path.gsub(/^\//, '')
else
  MongoMapper.database = "localhost_test"
end

class MyApp < Sinatra::Base
  register Mustache::Sinatra
  require File.join(File.dirname(__FILE__), "..", '/views/layout')

  set :mustache, {
    :views     => 'views/',
    :templates => 'templates/'
  }
  
  get '/' do
  @title = "Booky!"
  mustache :index
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