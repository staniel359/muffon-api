class BookmarkAlbum < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include BookmarkAlbumDecorator
  include EventableAlbum

  has_one_attached :image

  belongs_to :profile
  belongs_to :album

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
