User.destroy_all
Adventurer.destroy_all

3.times do
    User.create(
        name: Faker::TvShows::HeyArnold.character,
        username: Faker::Games::Pokemon.name,
        password: "password")
end

5.times do
    Adventurer.create(
        name: [Faker::FunnyName.two_word_name, Faker::FunnyName.three_word_name, Faker::FunnyName.four_word_name].sample,
        fantasy_origin: Faker::Games::DnD.race,
        class: Faker::Games::DnD.klass,
        hometown: Faker::Games::DnD.city,
        background: Faker::Games::DnD.background,
        weapon: [Faker::Games::DnD.melee_weapon, Faker::Games::DnD.ranged_weapon].sample,
        nemesis: Faker::Games::DnD.monster,

        experience_level: [1..20].sample,
        user_id: User.all.sample
    )
end


puts "ALL DESTROYED"