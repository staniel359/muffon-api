class VideoChannel < ApplicationRecord
  validates :youtube_id, presence: true
  validates :title, presence: true
end
