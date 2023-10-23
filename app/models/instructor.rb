class Instructor < ApplicationRecord
    belongs_to :user
    has_many :feedbacks
    # Validations
    validates :name, presence: true
end
