class LibraryTrack < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze

  include LibraryTrackDecorator

  belongs_to :profile, counter_cache: true
  belongs_to :track
  belongs_to :library_artist, counter_cache: true
  belongs_to :library_album,
             optional: true,
             counter_cache: true
end
