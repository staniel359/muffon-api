module TrackDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_artist_title(
      artist_id,
      title
    )
      title_formatted =
        title
        .strip
        .truncate(
          1_000
        )

      where(
        artist_id:,
        title_downcase:
          title_formatted.downcase
      )
        .first_or_create(
          title: title_formatted,
          player_id:
        )
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end

    def associated
      includes(:artist)
    end

    private

    def player_id
      SecureRandom.uuid unless test?
    end
  end
end
