class Post < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    updated
    deleted
  ].freeze
  EVENT_ATTRIBUTES = %w[
    text
    artists
    albums
    tracks
    playlists
    communities
    videos
    video_channels
    video_playlists
    by_community
  ].freeze

  include PostDecorator
  include SendableDecorator
  include Eventable

  enum :post_type, {
    profile: 0,
    community: 1
  }

  has_many_attached :images

  has_many :post_comments,
           dependent: :destroy

  belongs_to :profile

  belongs_to :other_profile,
             class_name: 'Profile',
             optional: true

  belongs_to :community,
             optional: true
end
