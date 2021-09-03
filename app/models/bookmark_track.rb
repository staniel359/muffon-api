class BookmarkTrack < ApplicationRecord
  belongs_to :profile
  belongs_to :track
  belongs_to :album, optional: true

  validates :track_id,
            uniqueness: {
              scope: :profile_id
            }
end
