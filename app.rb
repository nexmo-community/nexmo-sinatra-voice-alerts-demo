require 'sinatra'
require 'sinatra/activerecord'

require './models/subscriber'

set :database, {adapter: "sqlite3", database: "development.sqlite3"}

get '/' do
  @subscriber = Subscriber.new
  erb :index
end

post '/subscribe' do
  @subscriber = Subscriber.new(params.slice('name', 'number', 'postcode'))
  if @subscriber.save
    redirect "/subscribed"
  else
    erb :index
  end
end

get '/subscribed' do
  erb :subscribed
end
