class Profile < ApplicationRecord
  has_secure_password

  has_one_attached :avatar

  enum gender: {
    male: 0,
    female: 1,
    other: 2
  }

  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            }

  validates :password,
            presence: true,
            length: { minimum: 6 },
            on: :create

  validates :password,
            allow_blank: true,
            length: { minimum: 6 },
            on: :update

  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 30 }

  before_create :set_token

  def avatar_url
    return '' if avatar.blank?

    url_helpers.rails_blob_url(
      avatar,
      host: avatar_host
    )
  end

  private

  def set_token
    self.token = SecureRandom.uuid
  end

  def url_helpers
    Rails.application.routes.url_helpers
  end

  def avatar_host
    Rails.application.credentials.url
  end
end
