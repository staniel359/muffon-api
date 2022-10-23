class FavoriteAlbum < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze

  include FavoriteAlbumDecorator

  has_one_attached :image

  belongs_to :profile
  belongs_to :album

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
