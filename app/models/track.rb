class Track < ApplicationRecord
  has_many :profile_tracks, dependent: nil

  belongs_to :artist

  validates :title,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }

  validates :player_id,
            presence: true,
            uniqueness: true,
            unless: -> { Rails.env.test? }

  class << self
    def with_artist_title(artist_id, title)
      where(
        'artist_id = ? AND LOWER(title) = ?',
        artist_id, title.downcase
      ).first_or_create(
        artist_id: artist_id,
        title: title,
        player_id: player_id
      )
    end

    def associated
      includes(:artist)
    end

    private

    def player_id
      return '1' if Rails.env.test?

      SecureRandom.uuid
    end
  end
end
