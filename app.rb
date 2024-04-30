# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require :default

class Application < Sinatra::Base
  get '/', provides: :json do
    {
      available_endpoints: [
        {
          path: 'GET /',
          description: 'the root'
        },
        {
          path: 'GET /fast',
          description: ''
        },
        {
          path: 'GET /file.json',
          description: 'is it constant??'
        },
        {
          path: 'GET /nestness?n=<integer>',
          description: 'what is it? it contains a bug, go find it'
        }
      ]
    }.to_json
  end

  get '/fast' do
    sleep 3
    'is it?'
  end

  get '/file.json', provides: :json do
    {
      foo: { bar: { baz: :foooo }},
      rand: rand(1..100)
    }.to_json
  end

  get '/nestness', provides: :json do
    n = (params[:n] || 10).to_i
    response =
      if n < 0
        'whoops!'
      elsif n == 0
        return ''
      else
        opening = '[' * n
        center = JSON::dump("why?") if n >= 100 || n == 42
        closing = ']' * n
        JSON.parse("#{opening}#{center}#{closing}")
      end
    JSON::dump(response)
  end
end

Application.run!

