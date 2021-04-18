class AdventurersController < ApplicationController
    get "/adventurers" do
        if logged_in?
            @adventurers = Adventurer.all
            erb :"adventurers/index" 
        else
            redirect "/login"
        end
    end

    get "/adventurers/new" do #creates new adventurers. should be the first route before trying to do anything else
        if logged_in?
            erb :"adventurers/new" 
        else
            redirect "/login"
        end
    end

    get "/adventurers/:id" do #make sure the route is after the new method
        if logged_in?
            @adventurer = Adventurer.all.find_by_id(params[:id])
            erb :"adventurers/show"
        else
            redirect "/login"
        end
    end

    post "/adventurers" do
        # make our adventurers belong to a user
        # adventurer = adventurer.new(params)
        # adventurer.user_id = current_user.id
        adventurer = current_user.adventurers.build(params) #using helper method current_user which finds/returns a user object
        if adventurer.save 
            redirect "adventurers/#{adventurer.id}" #sends to page assigned to adventurer id
        else
            redirect "adventurers/new" #refreshes page
        end
    end
    
    get "/adventurers/:id/edit" do
        # binding.pry
        if logged_in?
            @adventurer = Adventurer.find_by_id(params[:id])
            if @adventurer.user_id != current_user.id || @adventurer.user_id == nil
                redirect "/adventurers"  
            else
                erb :"adventurers/edit"
            end
        else
            redirect "/login"
        end
    end

    patch "/adventurers/:id" do
        @adventurer = Adventurer.find_by_id(params[:id])
            params.delete("_method")
        @adventurer.update(params)

        if @adventurer.update(params) #Did We Make a Change?
            redirect "/adventurers/#{@adventurer.id}"
        else
            redirect "adventurers/new"
        end
    end

    delete "/adventurers/:id" do
        @adventurer = Adventurer.find_by_id(params[:id])
        @adventurer.destroy
        redirect "/adventurers"
    end

end