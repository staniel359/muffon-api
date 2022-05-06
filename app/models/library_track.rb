class LibraryTrack < ApplicationRecord
  include LibraryTrackDecorator

  belongs_to :profile
  belongs_to :track
  belongs_to :library_artist, counter_cache: true
  belongs_to :library_album,
             optional: true,
             counter_cache: true
end
