class User < ApplicationRecord
  has_one :user_datum
  after_initialize :init

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  def init
    self.is_admin ||= 0
    self.company_id ||= nil
  end

  def self.get_company(company_id)
    @company = CompanyDatum.find(company_id)
    @company
  end

  def self.get_user(id)
    @user = self.find_by(id: id)
    @user
  end

  def self.get_user_by_username(username)
    @user = self.find_by(username: username)
    @user
  end
end