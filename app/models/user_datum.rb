class UserDatum < ApplicationRecord
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

    before_save :default_values
    def default_values
        self.status ||= 'unemployed'
    end
end
