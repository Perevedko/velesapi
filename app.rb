# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require :default

class Application < Sinatra::Base
  get '/', provides: :json do
    {
      available_endpoints: ['GET /', 'GET /fast', 'GET /file.json']
    }.to_json
  end

  get '/fast' do
    sleep 5
    'is it?'
  end

  get '/file.json', provides: :json do
    {
      foo: { bar: { baz: :foooo }},
      rand: rand(1..100)
    }.to_json
  end
end

Application.run!

