class BookmarkArtist < ApplicationRecord
  include BookmarkArtistDecorator

  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
