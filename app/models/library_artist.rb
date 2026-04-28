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

  include EventableArtist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  after_create_commit :handle_after_create_commit

  after_destroy_commit :handle_after_destroy_commit

  has_many :library_tracks, dependent: :destroy

  has_many :library_albums, dependent: :destroy

  belongs_to :profile, counter_cache: true

  belongs_to :artist

  class << self
    def associated
      includes(
        :artist
      )
    end
  end

  def recommendation_artists
    RecommendationArtist.where(
      '? = ANY(library_artist_ids)',
      id
    )
  end

  private

  def handle_after_create_commit
    create_recommendations
  end

  def handle_after_destroy_commit
    clear_recommendations
  end

  def create_recommendations
    Muffon::Worker::Profile::Recommendations::Artists::Creator.call(
      profile_id:,
      library_artist_id: id
    )
  end

  def clear_recommendations
    Muffon::Worker::Profile::Recommendations::Artists::Clearer.call(
      profile_id:,
      library_artist_id: id
    )
  end

  def playlists_ids
    profile
      .playlist_tracks
      .where(
        artist_id:
      )
      .pluck(
        :playlist_id
      )
      .uniq
  end
end
