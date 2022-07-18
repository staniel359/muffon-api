module LibraryAlbumDecorator
  module ClassMethods
    def associated
      includes(
        :album,
        [library_artist: :artist],
        image_association
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
      .where(album_id:)
      .pluck(:playlist_id)
      .uniq
  end
end
