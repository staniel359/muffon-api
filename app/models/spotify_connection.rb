class SpotifyConnection < ApplicationRecord
  belongs_to :profile

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
end
