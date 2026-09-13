class Quote < ApplicationRecord
    validates :name, presence: true 

    scope :ordered, -> { order(updated_at: :desc) }
end
