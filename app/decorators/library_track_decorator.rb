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
end
