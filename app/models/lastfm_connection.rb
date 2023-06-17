class LastFMConnection < ApplicationRecord
  belongs_to :profile

  validates :nickname,
            :session_key,
            presence: true

  validates :premium,
            inclusion: [
              true,
              false
            ]
end
