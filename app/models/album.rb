class Album < ApplicationRecord
  has_many :profile_albums, dependent: nil

  belongs_to :artist

  validates :title,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }

  class << self
    def with_artist_title(artist_id, title)
      where(
        'artist_id = ? AND LOWER(title) = ?',
        artist_id, title.downcase
      ).first_or_create(
        artist_id:,
        title:
      )
    end
  end
end
