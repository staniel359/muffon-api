class ListenedArtist < ApplicationRecord
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
