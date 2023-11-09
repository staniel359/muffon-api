class FavoriteAlbum < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include FavoriteAlbumDecorator
  include EventableAlbum

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }

  has_one_attached :image

  belongs_to :profile
  belongs_to :album
end
