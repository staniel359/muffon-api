module ArtistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_name(
      name
    )
      with_cache_clearance_and_retry_on_error do
        name_formatted =
          name
          .strip
          .truncate(
            1_000
          )

        where(
          name_downcase:
            name_formatted.downcase
        )
          .first_or_create!(
            name: name_formatted
          )
      end
    end
  end

  def image_data
    LastFM::Utils::Image.call(
      image: image_url
    )
  end
end
