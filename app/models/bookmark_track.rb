class BookmarkTrack < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include BookmarkTrackDecorator
  include EventableTrack

  validates :track_id,
            uniqueness: {
              scope: :profile_id
            }

  has_one_attached :image

  belongs_to :profile

  belongs_to :track

  belongs_to :album,
             optional: true
end
