class BookmarkVideoChannel < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableVideoChannel

  validates :video_channel_id,
            uniqueness: {
              scope: :profile_id
            }

  validates :profile_id,
            uniqueness: {
              scope: :video_channel_id
            }

  belongs_to :video_channel
  belongs_to :profile
end
