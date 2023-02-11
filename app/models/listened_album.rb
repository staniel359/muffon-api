class ListenedAlbum < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include EventableAlbum

  belongs_to :profile
  belongs_to :album

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
