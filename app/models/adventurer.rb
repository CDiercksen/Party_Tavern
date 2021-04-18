class Adventurer < ActiveRecord::Base
    belongs_to :user

    validates 
    :name, 
    :fantasy_origin, 
    :class, 
    :hometown, 
    :background, 
    :weapon, 
    :nemesis,  presence: true
end