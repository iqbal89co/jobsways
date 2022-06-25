class UserDatum < ApplicationRecord
    validates :name, presence: true
    def self.get_user_datum(id)
        @user_datum = UserDatum.find_by(id: id)
        @user_datum
    end
end
