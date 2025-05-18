class PlaylistTrack < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    updated_desc
    updated_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include PlaylistTrackDecorator
  include EventableTrack

  validates :track_id,
            uniqueness: {
              scope: :playlist_id
            }

  has_one_attached :image

  belongs_to :playlist,
             counter_cache: 'tracks_count'

  belongs_to :track

  belongs_to :artist

  belongs_to :album,
             optional: true

  private

  def eventable_data
    super.merge(
      { playlist: playlist_data }
    )
  end

  def playlist_data
    {
      id: playlist_id,
      title: playlist.title
    }
  end
end
