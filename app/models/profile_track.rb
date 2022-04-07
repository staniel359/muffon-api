class ProfileTrack < ApplicationRecord
  include ProfileTrackDecorator

  belongs_to :profile
  belongs_to :track
  belongs_to :profile_artist, counter_cache: true
  belongs_to :profile_album,
             optional: true,
             counter_cache: true
end
