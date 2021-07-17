class Profile < ApplicationRecord
  has_secure_password

  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            }

  validates :password,
            presence: true,
            length: { minimum: 6 }

  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 30 }

  before_create :set_token

  private

  def set_token
    self.token = SecureRandom.uuid
  end
end
