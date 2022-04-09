module ApplicationRecordDecorator
  module ClassMethods
    def created_desc_ordered
      order(
        created_at: :desc
      )
    end

    def created_asc_ordered
      order(
        created_at: :asc
      )
    end

    def profile_tracks_count_desc_ordered
      order(
        profile_tracks_count: :desc
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def image_data
    image_data_formatted(
      image
    )
  end

  def images_data
    images.map do |i|
      image_data_formatted(i)
    end
  end

  def tracks
    Track.where(
      id: track_ids
    ).associated
  end

  def errors?
    errors.present?
  end

  def errors_data
    forbidden.merge(
      { errors: errors_formatted }
    )
  end

  private

  def image_data_formatted(image)
    Muffon::Utils::Image.call(
      image:
    )
  end

  def errors_formatted
    errors.map do |e|
      { e.attribute => e.type }
    end
  end
end
