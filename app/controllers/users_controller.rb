class UsersController < ApplicationController
    get "/users" do
        @users = User.all
        erb :"/users/index"
    end
    get '/signup' do
        erb :'users/signup'
    end

    post '/users' do
        # create a new user
        @user = User.new(params)
        # save the user -  # insert them into the database
        if @user && @user.save
            # set the session ID
            session[:user_id] = @user.id
            # redirect the user
            redirect "/thoughts"
        else
        # if it doesn't save
            # redirect them to the sign up page again
            erb :"users/signup"
        end
    end
end