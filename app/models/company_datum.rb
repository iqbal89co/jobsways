class CompanyDatum < ApplicationRecord
    
    has_one :user
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :total_employee, presence: true, numericality: true
    validates :email, presence: true, uniqueness: true
    validates :location, presence: true
    validates :website, presence: true, uniqueness: true

    def self.get_published_jobs(id)
        @jobs = Job.where(company_datum_id: id)
        @jobs
    end
end
