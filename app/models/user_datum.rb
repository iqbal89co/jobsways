class UserDatum < ApplicationRecord
    has_many :job_applications
    has_many :jobs, through: :job_applications
    belongs_to :user
    mount_uploader :resume, ResumeUploader

    validates :name, presence: true
    validates :status, presence: true, 
        inclusion: { in: %w(employed unemployed),
        message: "%{value} is not available" }

    def self.get_user_datum(id)
        @user_datum = self.find_by(id: id)
        @user_datum
    end

    def self.filter_by_type(type)
        @user_datum = self.where(["job_type = :type", {type: type}])
        @user_datum
    end
    
    def get_resume_url
        url_for(self.resume)
    end
end
