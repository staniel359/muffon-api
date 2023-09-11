class PostComment < ApplicationRecord
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

  include PostCommentDecorator
  include SendableDecorator
  include Eventable

  has_many_attached :images

  belongs_to :post
  belongs_to :profile
  belongs_to :community, optional: true
end
