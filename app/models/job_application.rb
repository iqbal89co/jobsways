class JobApplication < ApplicationRecord
    belongs_to :user_datum
    belongs_to :job
    validates :status, presence: true
end
