module VideoPlaylistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_youtube_id(
      youtube_id,
      update_params = {}
    )
      playlist =
        where(
          youtube_id:
        )
        .first_or_initialize

      playlist.update(
        attributes: update_params
      )

      playlist
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end
  end
end
