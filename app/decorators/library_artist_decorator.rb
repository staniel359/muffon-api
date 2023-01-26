module LibraryArtistDecorator
  module ClassMethods
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def recommendations
    Recommendation.where(
      '? = ANY(library_artist_ids)', id
    )
  end

  private

  def playlist_ids
    profile
      .playlist_tracks
      .where(artist_id:)
      .pluck(:playlist_id)
      .uniq
  end

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
