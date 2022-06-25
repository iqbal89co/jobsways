class CompanyDatum < ApplicationRecord
    has_many :jobs
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
