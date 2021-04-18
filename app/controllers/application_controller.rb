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
  helpers do #tells sinatra "these should be available everywhere"

    def logged_in?
      session[:user_id]
    end
  
    def current_user
     @user ||= User.find_by(id: session[:user_id]) #If we've already done the database lookup, return the @user instance variable OR SET User as found by specific session user_id
    end
  
  end
end
