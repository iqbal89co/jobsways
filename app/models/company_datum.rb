class CompanyDatum < ApplicationRecord
    has_many :jobs
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def self.get_published_jobs(id)
        @jobs = Job.where(company_datum_id: id)
        @jobs
    end
end
