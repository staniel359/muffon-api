class VideoPlaylist < ApplicationRecord
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
          .tap do |video_playlist|
            video_playlist.title = title
            video_playlist.channel_title = channel_title

            video_playlist.save!
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
      model: 'playlist'
    )
  end

  private

  def source_links_data
    { original: source_original_link }
  end

  def source_original_link
    "https://www.youtube.com/playlist?list=#{youtube_id}"
  end

  def video_channel_source_data
    {
      name: 'youtube',
      id: channel_youtube_id
    }.compact
  end
end
