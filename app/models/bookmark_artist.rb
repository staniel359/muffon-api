class BookmarkArtist < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze

  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
