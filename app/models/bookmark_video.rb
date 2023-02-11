class BookmarkVideo < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableVideo

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
