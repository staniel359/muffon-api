class LibraryAlbum < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    library_tracks_count_desc
    library_tracks_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include Imageable
  include EventableAlbum

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }

  has_one_attached :image

  has_many :library_tracks, dependent: :destroy

  belongs_to :profile, counter_cache: true

  belongs_to :library_artist, counter_cache: true

  belongs_to :album

  class << self
    def with_relations
      includes(
        :library_artist,
        {
          album: :artist,
          **image_association
        }
      )
    end
  end

  private

  def playlists_ids
    profile
      .playlist_tracks
      .where(
        album_id:
      )
      .pluck(
        :playlist_id
      )
      .uniq
  end
end
