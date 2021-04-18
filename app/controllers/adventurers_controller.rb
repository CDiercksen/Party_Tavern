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
            @adventurer = Adventurer.find_by_id(params[:id])
            erb :"adventurers/show"
        else
            redirect "/login"
        end
    end

    post "/adventurers" do
        # make our adventurers belong to a user
        # adventurer = adventurer.new(params)
        # adventurer.user_id = current_user.id
        if params[:randomize?] == "Yes"
            adventurer = Adventurer.create(
                name: [Faker::FunnyName.two_word_name, Faker::FunnyName.three_word_name, Faker::FunnyName.four_word_name].sample,
                fantasy_origin: Faker::Games::DnD.race,
                class: Faker::Games::DnD.klass,
                hometown: Faker::Games::DnD.city,
                background: Faker::Games::DnD.background,
                weapon: [Faker::Games::DnD.melee_weapon, Faker::Games::DnD.ranged_weapon].sample,
                nemesis: Faker::Games::DnD.monster,
        
                experience_level: rand(1..20),
                user_id: current_user.id
            )
            redirect "/adventurers/#{adventurer.id}"
        else
            params.delete(:randomize?)
            adventurer = current_user.adventurers.build(params) #using helper method current_user which finds/returns a user object
            if adventurer.save 
                 redirect "/adventurers/#{adventurer.id}" #sends to page assigned to adventurer id
            else
                redirect "/adventurers/new" #refreshes page
            end
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