class Profile < ApplicationRecord
  ORDERS = %w[
    created_desc created_asc
    library_artists_count_desc
    library_artists_count_asc
    library_albums_count_desc
    library_albums_count_asc
    library_tracks_count_desc
    library_tracks_count_asc
    followers_count_desc
    followers_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    updated
  ].freeze
  EVENT_ATTRIBUTES = %w[
    email
    password
    nickname
    gender
    birthdate
    country
    city
    private
  ].freeze

  include ProfileDecorator
  include Eventable

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

  has_secure_password

  has_one_attached :image

  has_many :library_tracks, dependent: :delete_all
  has_many :library_albums, dependent: :delete_all
  has_many :library_artists, dependent: :delete_all

  has_many :recommendations,
           class_name: '::Recommendation',
           dependent: :delete_all

  has_many :playlists, dependent: :delete_all

  has_many :favorite_artists, dependent: :delete_all
  has_many :favorite_albums, dependent: :delete_all
  has_many :favorite_tracks, dependent: :delete_all
  has_many :favorite_videos, dependent: :delete_all

  has_many :bookmark_artists, dependent: :delete_all
  has_many :bookmark_albums, dependent: :delete_all
  has_many :bookmark_tracks, dependent: :delete_all
  has_many :bookmark_videos, dependent: :delete_all
  has_many :bookmark_video_channels, dependent: :delete_all
  has_many :bookmark_video_playlists, dependent: :delete_all

  has_many :listened_artists, dependent: :delete_all
  has_many :listened_albums, dependent: :delete_all
  has_many :listened_tracks, dependent: :delete_all

  has_many :watched_videos, dependent: :delete_all

  has_many :own_posts,
           class_name: 'Post',
           dependent: nil

  has_many :posts,
           foreign_key: 'other_profile_id',
           inverse_of: :other_profile,
           dependent: :delete_all

  has_many :active_relationships,
           class_name: 'Relationship',
           inverse_of: :profile,
           dependent: :delete_all

  has_many :following_profiles,
           through: :active_relationships,
           source: :other_profile

  has_many :passive_relationships,
           foreign_key: 'other_profile_id',
           class_name: 'Relationship',
           inverse_of: :other_profile,
           dependent: :delete_all

  has_many :follower_profiles,
           through: :passive_relationships,
           source: :profile

  has_many :own_communities,
           class_name: 'Community',
           dependent: nil

  has_many :memberships, dependent: :delete_all

  has_many :communities, through: :memberships

  has_many :active_conversations,
           class_name: 'Conversation',
           dependent: nil

  has_many :passive_conversations,
           class_name: 'Conversation',
           foreign_key: 'other_profile_id',
           inverse_of: :other_profile,
           dependent: nil

  has_many :active_events,
           class_name: 'Event',
           dependent: :delete_all

  has_many :passive_events,
           class_name: 'Event',
           foreign_key: 'other_profile_id',
           inverse_of: :other_profile,
           dependent: nil

  has_many :playing_events, dependent: :delete_all
  has_many :browser_events, dependent: :delete_all

  has_one :lastfm_connection, dependent: :destroy
  has_one :spotify_connection, dependent: :destroy

  enum gender: {
    male: 0,
    female: 1,
    other: 2
  }

  enum role: {
    profile: 0,
    creator: 1
  }
end
