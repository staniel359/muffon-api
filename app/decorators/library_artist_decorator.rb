module LibraryArtistDecorator
  module ClassMethods
    def library_albums_count_desc_ordered
      order(
        library_albums_count: :desc
      )
    end
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
