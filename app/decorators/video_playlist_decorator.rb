module VideoPlaylistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_youtube_id(
      youtube_id:,
      update_attributes:
    )
      where(
        youtube_id:
      )
        .first_or_initialize
        .tap do |video_playlist|
        video_playlist.update!(
          update_attributes
        )
      end
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end
  end
end
