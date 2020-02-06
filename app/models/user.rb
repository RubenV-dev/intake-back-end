class User < ApplicationRecord
    has_many :food_entries
    has_many :foods, through: :food_entries
    has_secure_password
    validates :username, uniqueness: true
end
