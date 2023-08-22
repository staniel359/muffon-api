class LibraryArtist < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    library_albums_count_desc
    library_albums_count_asc
    library_tracks_count_desc
    library_tracks_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include LibraryArtistDecorator
  include EventableArtist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  after_create :update_artist_tags
  after_create :create_recommendations

  after_destroy :clear_recommendations

  belongs_to :profile, counter_cache: true
  belongs_to :artist

  has_many :library_tracks, dependent: :delete_all
  has_many :library_albums, dependent: :delete_all

  def create_recommendations
    Muffon::Worker::Profile::Recommendations::Creator.call(
      profile_id:,
      library_artist_id: id
    )
  end

  def clear_recommendations
    Muffon::Worker::Profile::Recommendations::Clearer.call(
      profile_id:,
      library_artist_id: id
    )
  end
end
