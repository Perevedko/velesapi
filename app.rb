require 'sinatra'

SLEEP_SECONDS = ENV.fetch('SLEEP_SECONDS') {1}.to_f

class Application < Sinatra::Base
  get '/' do
    <<-TEXT
      Hello.
      Explore the /foo and the /bar endpoints.
    TEXT
  end

  get '/foo' do
    'hello'
  end

  delete '/bar' do
    'how low?'
  end
end

Application.run!

