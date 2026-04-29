class VideoChannel < ApplicationRecord
  validates :youtube_id, presence: true

  validates :title, presence: true

  class << self
    def with_youtube_id(
      youtube_id:,
      title:
    )
      with_cache_clearance_and_retry_on_error do
        where(
          youtube_id:
        )
          .first_or_initialize
          .tap do |video_channel|
            video_channel.title = title

            video_channel.save!
          end
      end
    end
  end

  def source_data
    {
      name: 'youtube',
      id: youtube_id,
      links: source_links_data
    }
  end

  def image_data
    YouTube::Formatter::Image.call(
      image_url:
    )
  end

  private

  def source_links_data
    { original: source_original_link }
  end

  def source_original_link
    "https://www.youtube.com/channel/#{youtube_id}"
  end
end
