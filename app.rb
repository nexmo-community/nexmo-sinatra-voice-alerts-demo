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

# send an alert to the provided phone number or postcode
post '/alert' do
  if params[:number]
    send_alert(:number, params[:number])
  elsif params[:postcode]
    send_alert(:postcode, params[:postcode])
  end
  redirect '/alert'
end

# confirmation page for sending an alert
get '/alert' do
  erb :alert
end

private

def send_alert key, value
  Subscriber.where(key => value).each do |subscriber|
    Nexmo::Client.new.initiate_tts_call(
      to:     subscriber.number,
      from:   ENV['NEXMO_PHONE_NUMBER'],
      text:   %{
        <break time="1s"/> Hello #{subscriber.name}.
        This is a flood alert for
        <prosody rate="-50%">#{subscriber.postcode}</prosody>.
        Thank you for using Nexmo.
      },
      lg:     'en-gb'
    )
  end
end
