class LibraryAlbum < ApplicationRecord
  include LibraryAlbumDecorator

  has_one_attached :image

  belongs_to :profile
  belongs_to :library_artist, counter_cache: true
  belongs_to :album

  has_many :library_tracks, dependent: :destroy

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }
end
