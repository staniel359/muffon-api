class BookmarkAlbum < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include Imageable
  include EventableAlbum

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }

  has_one_attached :image

  belongs_to :profile

  belongs_to :album

  class << self
    def with_relations
      includes(
        album: :artist,
        **image_association
      )
    end
  end
end
