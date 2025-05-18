class VideoChannel < ApplicationRecord
  include VideoChannelDecorator

  validates :youtube_id,
            presence: true

  validates :title,
            presence: true
end
