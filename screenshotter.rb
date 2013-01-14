require 'sinatra'
require './config/logging'
Dir["./lib/*.rb"].each { |f| require f }

class Screenshotter < Sinatra::Base
  get '/' do
    send_file Screenshot.take(params[:url])
  end
end

