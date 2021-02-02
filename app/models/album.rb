class Album < ApplicationRecord
  enum album_type: { album: 0, group: 1 }, _prefix: 'type'

  validates :title, :album_type, presence: true

  belongs_to :artist

  def self.with_artist_id_title_type(artist_id, title, album_type)
    where(
      'artist_id = ? AND LOWER(title) = ? AND album_type = ?',
      artist_id, title.downcase, album_types[album_type]
    ).first_or_create!(
      artist_id: artist_id, title: title, album_type: album_type
    )
  end
end
