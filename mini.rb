require 'sinatra/base'

class Mini < Sinatra::Base

  get "/" do
    "Hello World"
  end
end
