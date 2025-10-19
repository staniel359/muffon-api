module VideoDecorator
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
        .tap do |video|
        video.update!(
          update_attributes
        )
      end
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid
      clear_cache && retry
    end
  end
end
