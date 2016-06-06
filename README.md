# Nexmo Flood Alerts Demo

A demo that implements broadcast alerts in Ruby
using Sinatra and the [Nexmo Text-To-Speech API](https://docs.nexmo.com/voice/text-to-speech).

## Basic Subscriptions Demo - basic-subscriptions branch

The [basic-subscriptions](../../tree/basic-subscriptions) branch is the starting point of the tutorial and is just a simple Sinatra app that allows a person to
subscribe to alerts with their name, postcode, and phone number.

### Usage

* Clone this repository
* Run `git checkout basic-subscriptions`
* Run `bundle install`
* Run `ruby app.rb`
* Visit http://localhost:4567/
* Register and login

## Broadcast Alerts - alerts branch

The [alerts](../../tree/alerts) branch is the end point of out tutorial,
adding way to target subscribers with a Flood Alert.

The differences between these two branches can be seen [here](../../compare/basic-subscriptions...alerts)
and in our in-dept tutorial.

### Usage

* Clone this repository
* Run `git checkout alerts`
* Run `bundle install`
* Copy `.env.example` to `.env` and add your [Nexmo API key and secret](https://dashboard.nexmo.com/settings)
* Run `ruby app.rb`
* Visit http://localhost:4567/
* Subscribe a number
* Head to `/admin` and send a alert to your number

## License

This sample is released under the [MIT License][license]

[license]: LICENSE.txt
