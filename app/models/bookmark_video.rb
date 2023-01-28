class BookmarkVideo < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze

  belongs_to :video
  belongs_to :profile

  validates :video_id,
            uniqueness: {
              scope: :profile_id
            }

  validates :profile_id,
            uniqueness: {
              scope: :video_id
            }
end
