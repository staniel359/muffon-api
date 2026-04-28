class Video < ApplicationRecord
  validates :youtube_id,
            presence: true,
            uniqueness: {
              scope: :channel_youtube_id
            }

  validates :title, presence: true

  validates :channel_youtube_id,
            uniqueness: {
              scope: :youtube_id
            }

  validates :channel_title, presence: true

  class << self
    def with_youtube_id(
      youtube_id:,
      title:,
      channel_title:
    )
      with_cache_clearance_and_retry_on_error do
        where(
          youtube_id:
        )
          .first_or_initialize
          .tap do |video|
            video.title = title
            video.channel_title = channel_title

            video.save!
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

  def video_channel_data
    {
      source: video_channel_source_data,
      title: channel_title
    }
  end

  def image_data
    YouTube::Formatter::Image.call(
      image_url:,
      model: 'video'
    )
  end

  private

  def source_links_data
    {
      original: source_original_link,
      streaming: source_streaming_link
    }
  end

  def source_original_link
    "https://www.youtube.com/watch?v=#{youtube_id}"
  end

  def source_streaming_link
    Muffon::Formatter::Source::StreamingLink.call(
      model: 'video',
      source_name: 'youtube',
      source_model_id: youtube_id
    )
  end

  def video_channel_source_data
    {
      name: 'youtube',
      id: channel_youtube_id
    }.compact
  end
end
