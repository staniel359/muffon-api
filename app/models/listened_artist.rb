class ListenedArtist < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableArtist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile
  belongs_to :artist
end
