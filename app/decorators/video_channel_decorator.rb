module VideoChannelDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_youtube_id(
      youtube_id,
      update_params = {}
    )
      channel =
        where(
          youtube_id:
        )
        .first_or_initialize

      channel.update(
        attributes: update_params
      )

      channel
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end
  end
end
