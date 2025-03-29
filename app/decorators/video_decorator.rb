module VideoDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_youtube_id(
      youtube_id,
      update_params = {}
    )
      video =
        where(
          youtube_id:
        )
        .first_or_initialize

      video.update(
        attributes: update_params
      )

      video
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end
  end
end
