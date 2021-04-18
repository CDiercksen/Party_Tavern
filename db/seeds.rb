User.destroy_all
Thought.destroy_all

3.times do
    User.create(
        name: "",
        username: "",
        password: "password")
end


puts "ALL DESTROYED"