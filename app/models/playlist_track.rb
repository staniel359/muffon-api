class PlaylistTrack < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    updated_desc
    updated_asc
  ].freeze

  include PlaylistTrackDecorator

  has_one_attached :image

  belongs_to :playlist, counter_cache: 'tracks_count'
  belongs_to :track
  belongs_to :artist
  belongs_to :album, optional: true

  validates :track_id,
            uniqueness: {
              scope: :playlist_id
            }
end
