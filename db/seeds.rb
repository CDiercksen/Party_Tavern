User.destroy_all
Adventurer.destroy_all

3.times do
    User.create(
        name: "",
        username: "",
        password: "password")
end

5.times do
    Adventurer.create(
        name: "",
        fantasy_origin: "",
        class: "",
        hometown: "",
        background: "",
        weapon: "",
        nemesis: "",

        experience_level: [1...20].sample
        user_id: User.all.sample
    )
end


puts "ALL DESTROYED"