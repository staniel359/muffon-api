class LibraryArtist < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    library_albums_count_desc
    library_albums_count_asc
    library_tracks_count_desc
    library_tracks_count_asc
  ].freeze

  include LibraryArtistDecorator

  after_create_commit :update_artist_tags
  after_create_commit :create_recommendations

  after_destroy_commit :clear_recommendations

  belongs_to :profile, counter_cache: true
  belongs_to :artist

  has_many :library_albums, dependent: :destroy
  has_many :library_tracks, dependent: :destroy

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
