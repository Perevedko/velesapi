# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require :default

class Application < Sinatra::Base
  get '/' do
    json do
      endpoints: %w[/foo /bar]
    end
  end

  get '/foo' do
    'hello hello hello'
  end

  delete '/bar' do
    'how low?'
  end
end

Application.run!

