class Profile < ApplicationRecord
  before_create :set_token

  has_secure_password

  has_one_attached :image

  has_many :profile_artists, dependent: nil
  has_many :profile_albums, dependent: nil
  has_many :profile_tracks, dependent: nil

  has_many :recommendations, dependent: nil

  has_many :listened_artists, dependent: nil
  has_many :listened_albums, dependent: nil
  has_many :listened_tracks, dependent: nil

  has_many :bookmark_artists, dependent: nil
  has_many :bookmark_albums, dependent: nil
  has_many :bookmark_tracks, dependent: nil

  has_many :favorite_artists, dependent: nil
  has_many :favorite_albums, dependent: nil
  has_many :favorite_tracks, dependent: nil

  has_many :playlists, dependent: nil

  has_many :profile_posts, dependent: nil

  has_many :posts,
           foreign_key: 'other_profile_id',
           class_name: 'ProfilePost',
           inverse_of: :other_profile,
           dependent: nil

  has_many :active_relationships,
           class_name: 'Relationship',
           inverse_of: :profile,
           dependent: nil

  has_many :following_profiles,
           through: :active_relationships,
           source: :other_profile

  has_many :passive_relationships,
           foreign_key: 'other_profile_id',
           class_name: 'Relationship',
           inverse_of: :other_profile,
           dependent: nil

  has_many :follower_profiles,
           through: :passive_relationships,
           source: :profile

  has_many :messages, dependent: nil

  enum gender: {
    male: 0,
    female: 1,
    other: 2
  }

  enum role: {
    profile: 0,
    creator: 1
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

  def conversations
    Conversation.where(
      'profile_id = :id OR other_profile_id = :id',
      id: id
    )
  end

  private

  def set_token
    self.token = SecureRandom.uuid
  end
end
