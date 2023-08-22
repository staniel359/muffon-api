module ArtistDecorator
  DEFAULT_IMAGE_URL =
    'https://lastfm.freetls.fastly.net/i/u/300x300' \
    '/2a96cbd8b46e442fc41c2b86b821562f.png'.freeze

  extend ActiveSupport::Concern

  class_methods do
    def with_name(name)
      name_formatted = name.strip.truncate(1_000)

      where(
        name_downcase: name_formatted.downcase
      ).first_or_create(
        name: name_formatted
      )
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end
  end

  def image_data
    LastFM::Utils::Image.call(
      image: image_url_conditional
    )
  end

  private

  def image_url_conditional
    image_missing? ? DEFAULT_IMAGE_URL : image_url
  end

  def image_missing?
    image_url == 'MISSING'
  end
end
