module VideoChannelDecorator
  extend ActiveSupport::Concern

  class_methods do
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
end
