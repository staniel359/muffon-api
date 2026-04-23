module AlbumDecorator
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
            artist_id:,
            title: title_formatted
          )
      end
    end
  end

  def image_data
    LastFM::Formatter::Image.call(
      image_url:
    )
  end

  def profiles_count
    profiles
      .not_deleted
      .count
  end
end
