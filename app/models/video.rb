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

  def source_data(
    source_name: 'youtube'
  )
    {
      name: source_name,
      id: youtube_id,
      links: source_links_data(
        source_name:
      )
    }
  end

  def video_channel_data(
    source_name: 'youtube'
  )
    {
      source: video_channel_source_data(
        source_name:
      ),
      title: channel_title
    }
  end

  def image_data
    YouTube::Formatter::Image.call(
      image_url:
    )
  end

  private

  def source_links_data(
    source_name:
  )
    {
      original: source_original_link(
        source_name:
      ),
      streaming: source_streaming_link(
        source_name:
      )
    }
  end

  def source_original_link(
    source_name:
  )
    if source_name == 'youtubemusic'
      "https://music.youtube.com/watch?v=#{youtube_id}"
    else
      "https://www.youtube.com/watch?v=#{youtube_id}"
    end
  end

  def source_streaming_link(
    source_name:
  )
    Muffon::Formatter::Source::StreamingLink.call(
      model: 'video',
      source_name:,
      source_model_id: youtube_id
    )
  end

  def video_channel_source_data(
    source_name:
  )
    {
      name: source_name,
      id: channel_youtube_id
    }.compact
  end
end
