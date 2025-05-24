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

  include LibraryAlbumDecorator
  include EventableAlbum

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }

  has_one_attached :image

  has_many :library_tracks,
           dependent: :destroy

  belongs_to :profile,
             counter_cache: true

  belongs_to :library_artist,
             counter_cache: true

  belongs_to :album
end
