module LibraryArtistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        :artist
      )
    end
  end

  def recommendation_artists
    RecommendationArtist.where(
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
end
