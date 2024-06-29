module VideoPlaylistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_youtube_id(
      youtube_id,
      update_params = {}
    )
      where(
        youtube_id:
      ).first_or_initialize.tap do |v|
        v.attributes = update_params

        v.save
      end
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end
  end
end
