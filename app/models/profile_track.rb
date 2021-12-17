class ProfileTrack < ApplicationRecord
  belongs_to :profile
  belongs_to :track
  belongs_to :profile_artist,
             counter_cache: true
  belongs_to :profile_album,
             optional: true,
             counter_cache: true

  class << self
    def associated
      includes(
        track: :artist,
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
end
