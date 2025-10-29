module TrackDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_artist_title(
      artist_id:,
      title:
    )
      with_cache_clearance_and_retry_on_error do
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
          .first_or_create!(
            title: title_formatted,
            player_id:
          )
      end
    end

    def associated
      includes(
        :artist
      )
    end

    private

    def player_id
      return if test?

      SecureRandom.uuid
    end
  end
end
