class LibraryTrack < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include LibraryTrackDecorator
  include EventableTrack

  belongs_to :profile, counter_cache: true
  belongs_to :track
  belongs_to :library_artist, counter_cache: true
  belongs_to :library_album,
             optional: true,
             counter_cache: true

  after_create :create_recommendations

  after_destroy :clear_recommendations

  private

  def create_recommendations
    Muffon::Worker::Profile::Recommendations::Tracks::Creator.call(
      profile_id:,
      library_track_id: id
    )
  end

  def clear_recommendations
    Muffon::Worker::Profile::Recommendations::Tracks::Clearer.call(
      profile_id:,
      library_track_id: id
    )
  end
end
