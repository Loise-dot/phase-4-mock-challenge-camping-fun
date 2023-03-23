class Camper < ApplicationRecord
    validates :name, presence: true
    validates :age, inclusion: { in: (8..18), message: 'Please enter age between 8 and 18'}
    has_many :signups
    has_many :activities, through: :signups
end
