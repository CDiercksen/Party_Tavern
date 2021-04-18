class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do

        #find the user - but we don't have a user_id! What information is unique to each user? in this case, username. (how do we enforce unique username?)
        user = User.find_by(username: params[:username])
        #check to see if the user exists and if the password matches
        if 
            user && user.authenticate(params[:password])
        #put the user into sessions
            session[:user_id] = user.id #this is the line that's actually logging the user in
        #redirect them somewhere
            redirect "/thoughts"
        #if they don't exist, then redirect somewhere else...
        else 
            redirect "/login"
        end
    end

    get '/logout' do
        session.clear
        redirect "/login"
    end
end