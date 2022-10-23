module LibraryArtistDecorator
  module ClassMethods
  end

  def self.included(base)
    base.extend ClassMethods
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
