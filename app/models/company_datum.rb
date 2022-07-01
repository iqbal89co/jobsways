class CompanyDatum < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :total_employee, presence: true, numericality: true
    validates :email, presence: true
    validates :location, presence: true
    validates :website, presence: true

    def self.get_published_jobs(id)
        @jobs = Job.where(company_datum_id: id)
        @jobs
    end
end
