require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'

Dir["./migrations/*.rb"].each {|file| require file }

require './mini'


