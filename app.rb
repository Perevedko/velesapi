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
  end

  delete '/bar' do
  end
end

Application.run!

