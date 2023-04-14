module ArtistDecorator
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
      image: image_url
    )
  end

  def update_tags
    return if tag_ids.present?

    Muffon::Worker::Artist::Tags::Updater.call(
      name:
    )
  end
end
