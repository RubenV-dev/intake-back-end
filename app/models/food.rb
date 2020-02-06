class Food < ApplicationRecord
    has_many :food_entries
    has_many :users, through: :food_entries
end
