module LibraryTrackDecorator
  extend ActiveSupport::Concern

  class_methods do
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
        id: library_album_ids
      )
  end

  private

  def playlist_ids
    profile
      .playlist_tracks
      .where(track_id:)
      .pluck(:playlist_id)
      .uniq
  end

  def library_album_ids
    profile
      .library_tracks
      .where(track_id:)
      .pluck(:library_album_id)
  end
end
