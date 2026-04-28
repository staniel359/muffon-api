class LibraryTrack < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include Imageable
  include EventableTrack

  after_create_commit :handle_after_create_commit

  after_destroy_commit :handle_after_destroy_commit

  belongs_to :profile, counter_cache: true

  belongs_to :track

  belongs_to :library_artist, counter_cache: true

  belongs_to :library_album,
             optional: true,
             counter_cache: true

  class << self
    def associated
      includes(
        :track,
        library_artist: :artist,
        library_album: [
          :album,
          image_association
        ]
      )
    end

    def album_associated
      includes(
        track: :artist,
        library_album: [
          :album,
          image_association
        ]
      )
    end
  end

  def library_albums
    profile
      .library_albums
      .where(
        id: library_albums_ids
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

  def library_albums_ids
    profile
      .library_tracks
      .where(
        track_id:
      )
      .pluck(
        :library_album_id
      )
  end

  def playlists_ids
    profile
      .playlist_tracks
      .where(
        track_id:
      )
      .pluck(
        :playlist_id
      )
      .uniq
  end
end
