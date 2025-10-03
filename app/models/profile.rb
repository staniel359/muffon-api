class Profile < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    followers_count_desc
    followers_count_asc
    followed_desc
    followed_asc
    joined_desc
    joined_asc
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
    status
    private
  ].freeze

  include ProfileDecorator
  include Eventable

  validates :email,
            presence: true,
            uniqueness: true,
            length: { maximum: 100 },
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
            length: { maximum: 40 }

  enum :gender, {
    male: 0,
    female: 1,
    other: 2
  }

  enum :role, {
    profile: 0,
    creator: 1
  }

  before_create :handle_before_create

  before_destroy :handle_before_destroy

  has_secure_password

  has_one_attached :image

  has_one :lastfm_connection,
          dependent: :destroy

  has_one :spotify_connection,
          dependent: :destroy

  has_many :library_tracks,
           dependent: :destroy

  has_many :library_albums,
           dependent: :destroy

  has_many :library_artists,
           dependent: :destroy

  has_many :recommendation_artists,
           dependent: :delete_all

  has_many :recommendation_tracks,
           dependent: :delete_all

  has_many :playlists,
           dependent: :destroy

  has_many :playlist_tracks,
           through: :playlists

  has_many :favorite_artists,
           dependent: :delete_all

  has_many :favorite_albums,
           dependent: :destroy

  has_many :favorite_tracks,
           dependent: :destroy

  has_many :favorite_videos,
           dependent: :delete_all

  has_many :bookmark_artists,
           dependent: :delete_all

  has_many :bookmark_albums,
           dependent: :destroy

  has_many :bookmark_tracks,
           dependent: :destroy

  has_many :bookmark_videos,
           dependent: :delete_all

  has_many :bookmark_video_channels,
           dependent: :delete_all

  has_many :bookmark_video_playlists,
           dependent: :delete_all

  has_many :listened_artists,
           dependent: :delete_all

  has_many :listened_albums,
           dependent: :delete_all

  has_many :listened_tracks,
           dependent: :delete_all

  has_many :watched_videos,
           dependent: :delete_all

  has_many :own_posts,
           class_name: 'Post',
           dependent: nil

  has_many :posts,
           foreign_key: 'other_profile_id',
           inverse_of: :other_profile,
           dependent: :destroy

  has_many :post_comments,
           through: :posts

  has_many :own_post_comments,
           class_name: 'PostComment',
           dependent: nil

  has_many :active_relationships,
           class_name: 'Relationship',
           inverse_of: :profile,
           dependent: :destroy

  has_many :following_profiles,
           through: :active_relationships,
           source: :other_profile

  has_many :passive_relationships,
           foreign_key: 'other_profile_id',
           class_name: 'Relationship',
           inverse_of: :other_profile,
           dependent: :destroy

  has_many :follower_profiles,
           through: :passive_relationships,
           source: :profile

  has_many :own_communities,
           class_name: 'Community',
           dependent: nil

  has_many :memberships,
           dependent: :destroy

  has_many :communities,
           through: :memberships

  has_many :messages,
           dependent: nil

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
           dependent: :delete_all

  has_many :playing_events,
           dependent: :delete_all

  has_many :browser_events,
           dependent: :delete_all

  def delete_library!
    delete_recommendations!

    delete_library_tracks!

    delete_library_albums!

    delete_library_artists!
  end

  private

  def handle_before_create
    set_token
  end

  def handle_before_destroy
    clear_info
  end

  def clear_info
    attributes_list.each_key do |attribute|
      self[attribute] = nil
    end

    save!(
      validate: false
    )
  end

  def attributes_list
    attributes.except(
      'id',
      'created_at',
      'updated_at'
    )
  end

  def delete_recommendations!
    clear_recommendation_tracks_queue

    recommendation_tracks.delete_all

    clear_recommendation_artists_queue

    recommendation_artists.delete_all
  end

  def clear_recommendation_tracks_queue
    Sidekiq::Queue
      .new(
        "profile_recommendation_tracks_#{id}"
      )
      .clear
  end

  def clear_recommendation_artists_queue
    Sidekiq::Queue
      .new(
        "profile_recommendation_artists_#{id}"
      )
      .clear
  end

  def delete_library_tracks!
    library_tracks.delete_all

    Profile.reset_counters(
      id,
      :library_tracks_count
    )
  end

  def delete_library_albums!
    library_albums.delete_all

    Profile.reset_counters(
      id,
      :library_albums_count
    )
  end

  def delete_library_artists!
    library_artists.delete_all

    Profile.reset_counters(
      id,
      :library_artists_count
    )
  end
end
