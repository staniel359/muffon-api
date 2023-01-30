class Video < ApplicationRecord
  validates :youtube_id,
            presence: true,
            uniqueness: {
              scope: :channel_youtube_id
            }

  validates :title,
            presence: true

  validates :channel_youtube_id,
            presence: true,
            uniqueness: {
              scope: :youtube_id
            }

  validates :channel_title,
            presence: true
end