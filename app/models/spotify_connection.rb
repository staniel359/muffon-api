class SpotifyConnection < ApplicationRecord
  validates :spotify_id,
            :nickname,
            :access_token,
            :refresh_token,
            presence: true

  validates :premium,
            inclusion: [
              true,
              false
            ]

  belongs_to :profile
end
