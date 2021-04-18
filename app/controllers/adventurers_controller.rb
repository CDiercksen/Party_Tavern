class AdventurersController < ApplicationController
    get "/adventurers" do
        #if logged_in?
            @adventurers = Adventurer.all
            erb :"adventurers/index" 
        #else
            #redirect "/login"
        #end
    end
end