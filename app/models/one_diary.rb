class OneDiary < ApplicationRecord
    validates :date, presence: true, uniqueness: true
    has_many_attached :images
end
