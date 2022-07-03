class Job < ApplicationRecord
    belongs_to :company_datum
    has_many :job_applications
    has_many :user_data, through: :job_applications
    validates :title, presence: true
    validates :position, presence: true
    validates :salary, presence: true
    validates :location, presence: true
    validates :job_type, presence: true, 
        inclusion: { in: %w(internship part-time full-time),
        message: "%{value} is not available" }
    validates :description, presence: true
    validates :status, presence: true, 
        inclusion: { in: %w(hiring closed),
        message: "%{value} is not available" }

    def self.get_all_jobs
        @jobs = Job.all
        @jobs
    end

    def self.get_job(id)
        @job = Job.find_by(id: id)
        @job
    end

    def self.search_job(key)
        @job = Job.where('title LIKE :search OR position LIKE :search OR description LIKE :search', search: "%#{key}%")
        @job
    end
    
    before_save :default_values
    def default_values
        self.status ||= 'closed'
    end
end
