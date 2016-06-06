# load the .env file
require 'dotenv'
Dotenv.load

require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/activerecord'
# we're using nexmo to send our voice messages
require 'nexmo'

# set up our Subscriber database model
require './models/subscriber'
set :database, {adapter: "sqlite3", database: "development.sqlite3"}

# the form for a new subscriber to sign up for alerts
get '/' do
  @subscriber = Subscriber.new
  erb :index
end

# validate and save the new subscriber details
post '/subscribe' do
  @subscriber = Subscriber.new(params.slice('name', 'number', 'postcode'))
  if @subscriber.save
    redirect "/subscribed"
  else
    erb :index
  end
end

# thank youpage for subscribers
get '/subscribed' do
  erb :subscribed
end

# admin page (unprotected)
get '/admin' do
  erb :admin
end
