class Profile < ApplicationRecord
  has_secure_password

  has_one_attached :image

  has_many :profile_artists, dependent: nil
  has_many :profile_albums, dependent: nil
  has_many :profile_tracks, dependent: nil

  has_many :recommendations, dependent: nil

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

  def image_url
    return '' if image.blank?

    url_helpers.rails_blob_url(
      image,
      host: host
    )
  end

  private

  def set_token
    self.token = SecureRandom.uuid
  end
end
