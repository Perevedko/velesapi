require 'rubygems'
require 'bundler/setup'
Bundler.require :default

class Application < Sinatra::Base
  get '/' do
    json(routes: %w[/ foo bar])
  end

  get '/foo' do
    'hello hello hello'
  end

  delete '/bar' do
    'how low?'
  end
end

Application.run!

