class Quote < ApplicationRecord
    belongs_to :company

    validates :name, presence: true 

    scope :ordered, -> { order(updated_at: :desc) }

    after_create_commit -> { broadcast_prepend_later_to [ self.company, "quotes"], partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
    after_update_commit -> { broadcast_prepend_later_to [ self.company, "quotes"] }
    after_destroy_commit -> { broadcast_remove_to [ self.company, "quotes"] }
    # broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
