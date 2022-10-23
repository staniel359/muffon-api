class LibraryAlbum < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    library_tracks_count_desc
    library_tracks_count_asc
  ].freeze

  include LibraryAlbumDecorator

  has_one_attached :image

  belongs_to :profile, counter_cache: true
  belongs_to :library_artist, counter_cache: true
  belongs_to :album

  has_many :library_tracks, dependent: :destroy

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
