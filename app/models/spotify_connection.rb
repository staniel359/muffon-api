class SpotifyConnection < ApplicationRecord
  DATA_KEYS = %i[
    spotify_id
    nickname
    premium
    image_url
  ].freeze

  validates :spotify_id,
            :nickname,
            :access_token,
            :refresh_token,
            :client_id,
            :client_secret,
            presence: true

  validates :premium,
            inclusion: [
              true,
              false
            ]

  belongs_to :profile
end
