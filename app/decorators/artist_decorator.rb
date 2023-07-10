module ArtistDecorator
  DEFAULT_IMAGE_URL =
    'https://lastfm.freetls.fastly.net/i/u/300x300' \
    '/2a96cbd8b46e442fc41c2b86b821562f.png'.freeze

  module ClassMethods
    def with_name(name)
      name_formatted =
        name.strip.truncate(1_000)

      where(
        name_downcase: name_formatted.downcase
      ).first_or_create(
        name: name_formatted
      )
    rescue ActiveRecord::RecordNotUnique
      clear_cache

      retry
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def image_data
    LastFM::Utils::Image.call(
      image: image_url_conditional
    )
  end

  def image_url_conditional
    if image_missing?
      DEFAULT_IMAGE_URL
    else
      image_url
    end
  end

  def image_missing?
    image_url == 'MISSING'
  end

  def update_tags
    return if tag_ids.present?

    Muffon::Worker::Artist::Tags::Updater.call(
      name:
    )
  end
end
