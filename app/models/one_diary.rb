class OneDiary < ApplicationRecord
    validates :date, presence: true, uniqueness: true
end
