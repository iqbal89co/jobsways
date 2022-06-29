class CompanyDatum < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    def self.get_published_jobs(id)
        @jobs = Job.where(company_datum_id: id)
        @jobs
    end
end
