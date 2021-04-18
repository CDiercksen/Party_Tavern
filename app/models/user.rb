class User < ActiveRecord::Base
    has_secure_password
    
    has_many :adventurers

    validates :username, :name, presence: true
    validates :username, uniqueness: true

    # def randomize
    #     Adventurer.create(
    #         name: [Faker::FunnyName.two_word_name, Faker::FunnyName.three_word_name, Faker::FunnyName.four_word_name].sample,
    #         fantasy_origin: Faker::Games::DnD.race,
    #         class: Faker::Games::DnD.klass,
    #         hometown: Faker::Games::DnD.city,
    #         background: Faker::Games::DnD.background,
    #         weapon: [Faker::Games::DnD.melee_weapon, Faker::Games::DnD.ranged_weapon].sample,
    #         nemesis: Faker::Games::DnD.monster,
    
    #         experience_level: rand(1..20),
    #         user_id: self.id
    #     )
    # end
end