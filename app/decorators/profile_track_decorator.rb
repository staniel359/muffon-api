module ProfileTrackDecorator
  module ClassMethods
    def associated
      includes(
        :track,
        profile_artist: :artist,
        profile_album: [
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
