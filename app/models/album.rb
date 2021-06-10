class Album < ApplicationRecord
  validates :title, presence: true

  belongs_to :artist

  class << self
    def with_artist_title(artist_name, title)
      artist_id = ::Artist.with_name(artist_name).id
      albums = with_artist_id_title(artist_id, title)

      albums.first_or_create!(
        artist_id: artist_id,
        title: title
      )
    end

    private

    def with_artist_id_title(artist_id, title)
      where(
        'artist_id = ? AND LOWER(title) = ?',
        artist_id, title.downcase
      )
    end
  end
end
