class LastFMConnection < ApplicationRecord
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
