module LibraryTrackDecorator
  module ClassMethods
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
        track: :artist
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
      .where(track_id:)
      .pluck(:playlist_id)
      .uniq
  end
end
