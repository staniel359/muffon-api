class ListenedAlbum < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableAlbum

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile

  belongs_to :album
end
