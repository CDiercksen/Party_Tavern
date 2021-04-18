require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #required for the browser to keep track of persistent data
    set :session_secret, "thisisoursessionsecret"
  end

  get "/" do
    erb :welcome
  end

end
