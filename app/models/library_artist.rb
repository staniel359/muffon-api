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

  before_destroy :delete_data

  after_destroy :clear_recommendations

  belongs_to :profile, counter_cache: true
  belongs_to :artist

  has_many :library_tracks, dependent: :delete_all
  has_many :library_albums, dependent: :delete_all

  private

  def create_recommendations
    Muffon::Worker::Profile::Recommendations::Artists::Creator.call(
      profile_id:,
      library_artist_id: id
    )
  end

  def delete_data
    delete_images
  end

  def delete_images
    library_albums.find_each do |a|
      a.image.purge_later
    end
  end

  def clear_recommendations
    Muffon::Worker::Profile::Recommendations::Artists::Clearer.call(
      profile_id:,
      library_artist_id: id
    )
  end
end
