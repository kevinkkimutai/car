class Car < ApplicationRecord
    has_many :photos, dependent: :destroy

end
