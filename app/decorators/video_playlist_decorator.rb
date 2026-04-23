module VideoPlaylistDecorator
  extend ActiveSupport::Concern

  class_methods do
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
end
