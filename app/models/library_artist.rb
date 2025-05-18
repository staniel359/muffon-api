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

  after_create_commit :handle_after_create_commit

  after_destroy_commit :handle_after_destroy_commit

  has_many :library_tracks,
           dependent: :destroy

  has_many :library_albums,
           dependent: :destroy

  belongs_to :profile,
             counter_cache: true

  belongs_to :artist

  private

  def handle_after_create_commit
    update_artist_tags

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
end
