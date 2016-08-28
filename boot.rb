require 'rubygems'
require 'bundler'

Bundler.require

# Load dotenv
Dotenv.load

require 'sinatra'

# Start database
require 'sinatra/sequel'
Dir["./migrations/*.rb"].each {|file| require file }
Dir["./models/*.rb"].each {|file| require file }

# Require lib files
Dir["./lib/*.rb"].each {|file| require file }

# Require the app
require './mini'
