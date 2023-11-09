class BookmarkVideoPlaylist < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableVideoPlaylist

  validates :video_playlist_id,
            uniqueness: {
              scope: :profile_id
            }

  validates :profile_id,
            uniqueness: {
              scope: :video_playlist_id
            }

  belongs_to :video_playlist
  belongs_to :profile
end
