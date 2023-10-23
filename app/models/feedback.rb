class Feedback < ApplicationRecord
    # Associations
    belongs_to :user

    # Validations
    validates :comment, presence: true
end
