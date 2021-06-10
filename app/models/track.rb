class Track < ApplicationRecord
  validates :title, :player_id, presence: true

  belongs_to :artist

  class << self
    def with_artist_title(artist_name, title)
      artist_id = ::Artist.with_name(artist_name).id
      tracks = with_artist_id_title(artist_id, title)

      tracks.first_or_create!(
        artist_id: artist_id,
        title: title,
        player_id: player_id
      )
    end

    private

    def with_artist_id_title(artist_id, title)
      where(
        'artist_id = ? AND LOWER(title) = ?',
        artist_id, title.downcase
      )
    end

    def player_id
      return '1' if Rails.env.test?

      SecureRandom.uuid
    end
  end
end
