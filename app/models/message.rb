class Message < ApplicationRecord
    # Associations
    belongs_to :sender_user_id, class_name: "User"
    belongs_to :recipient_user_id, class_name: "User"

    # Validations
    validates :content, presence: true
end
