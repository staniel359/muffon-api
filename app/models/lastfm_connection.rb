class LastFMConnection < ApplicationRecord
  DATA_KEYS = %i[
    nickname
    premium
    image_url
  ].freeze

  validates :nickname,
            :session_key,
            presence: true

  validates :premium,
            inclusion: [
              true,
              false
            ]

  belongs_to :profile
end
