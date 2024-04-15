require 'rubygems'
require 'bundler/setup'
Bundler.require :default

class Application < Sinatra::Base
  get '/' do
    <<-TEXT
      Hello.
      Explore the /foo and the /bar endpoints.
    TEXT
  end

  get '/foo' do
    'hello hello hello'
  end

  delete '/bar' do
    'how low?'
  end
end

Application.run!

