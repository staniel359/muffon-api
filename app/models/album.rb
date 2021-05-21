class Album < ApplicationRecord
  validates :title, presence: true

  belongs_to :artist

  def self.with_artist_id_title(artist_id, title)
    where(
      'artist_id = ? AND LOWER(title) = ?',
      artist_id, title.downcase
    ).first_or_create!(
      artist_id: artist_id, title: title
    )
  end
end
