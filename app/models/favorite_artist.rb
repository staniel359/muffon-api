class FavoriteArtist < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableArtist

  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }
end
